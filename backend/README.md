# Wolfpack Bus — Backend

A small Swift backend that fetches Wolfline bus data from Passio, shrinks it, and caches it for a few seconds so every phone reads a cached copy instead of hitting Passio. The iOS app talks only to this API; it never sees Passio or GTFS.

> **Status:** planning. The folders below are filled in one GitHub issue at a time, the same way the iOS components are. Nothing here is deployed yet.

## How it fits together

```
phone ──► CloudFront (cache, ~5 s) ──► Lambda (Swift) ──► Passio feeds
```

- **Phones** ask CloudFront. If its copy is under 5 seconds old, it answers and nothing else runs.
- **Lambda** runs only when the cached copy has expired: it fetches Passio once, trims the data, and returns it.
- **Result:** Passio sees about one request every 5 seconds no matter how many students use the app.

Apple Maps (map, walking directions, place search) runs on the phone and never touches the backend.

## What the backend serves

| Endpoint | Returns | Cached for |
|---|---|---|
| `GET /v1/vehicles` | Every bus: id, route, position, heading, occupancy | 5 s |
| `GET /v1/arrivals` | Upcoming arrivals for every stop, labeled `live`, `estimated` or `scheduled` | 5 s |
| `GET /v1/static` | Routes, stops, colors, route lines, version | 1 day |
| `GET /v1/alerts` | Active service alerts | 60 s |
| `POST /v1/plan` | Bus legs for a trip | none |
| `GET /v1/config` | Banner message, polling intervals, minimum app version | 5 min |
| `GET /v1/health` | Backend and Passio feed status | none |
| `POST /v1/feedback` | Forwards feedback to Discord | none |

Every response carries `updatedAt` and `stale`. Public data, so there is no login.

The full field-by-field contract lives in `backend/docs/api.md` once Manish adds it. Build against that file, not against Passio's raw feeds.

## Rules

1. **Passio's JSON shapes stay inside the backend.** The app only ever sees our API.
2. **One shared Swift package holds the response models**, used by both the app and the Lambda. Rename a field and the build breaks, instead of the app.
3. **Test locally against recorded snapshots.** Buses don't run during meetings, so we save real feed responses and replay them. Nobody needs AWS access to work on an issue.
4. **Only the deploy pipeline touches AWS.** Never paste AWS keys, tokens or account details into code, issues, PRs or chat. This repo is public.
5. **Use the same cache rules everywhere:** cache key is the path only, so use `/v1/arrivals`, not `?stop=`.

## Planned layout

```
backend/
├── README.md        you are here
├── docs/            api.md and sample feed files
├── Packages/        shared models (used by app and Lambda)
├── Sources/         the Lambda: router, Passio client, one file per endpoint
├── Tests/           tests that run against recorded snapshots
└── template.yaml    SAM template: describes the Lambda and CloudFront
```

## Picking up a backend issue

Same flow as the iOS issues: pick one from **Ready** on the project board, work on the branch the issue names, open a PR with `Closes #<number>`, and Manish reviews. Look for the `backend` label and the component label (for example `backend: vehicles`).

Branches go to `development`; Manish merges `development` into `main` for releases.
