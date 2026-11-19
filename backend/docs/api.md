# Wolfpack Bus API — v1 (draft)

This is the contract between the app and the backend. The iOS app builds against it using mock data until the backend is live; the backend builds against it using recorded Passio snapshots. **If a field changes here, change the shared models package in the same PR** so the build breaks instead of the app.

> **Status: draft.** Field names and shapes below are proposals made from the Wolfline feeds as seen on Nov 16, 2026. Anything under "Open questions" at the bottom is not decided.
>
> **Examples are illustrative.** Ids, stop names, times and the polyline strings in the JSON samples are made-up values that show the shape of a response. Real values come from the recorded snapshots in `backend/docs/samples/`, once those are added.

## Conventions

| | |
|---|---|
| Base URL | Not final. Until the domain exists it is the CloudFront address of the deployed stack (dev and prod each have their own). |
| Versioning | Every path starts with `/v1/`. A breaking change means `/v2/`, not an edit. |
| Auth | None. The data is public. |
| Format | JSON, UTF-8. Keys are `camelCase`. |
| Times | Unix seconds, UTC, as integers. |
| Coordinates | Decimal degrees as numbers: `lat`, `lon`. |
| IDs | Strings, taken as-is from the Wolfline GTFS feed (`stop_id`, `route_id`). Never numbers. |
| Cache keys | The CloudFront cache key is the **path only**. No query strings, headers or cookies change a response, so never design an endpoint around `?stop=`. |

Every successful response carries two fields at the top level:

| Field | Type | Meaning |
|---|---|---|
| `updatedAt` | integer | When the backend last got fresh data from Passio, in Unix seconds |
| `stale` | boolean | `true` if `updatedAt` is too old to trust. The app should still show the data, with a "last updated" note. |

## Endpoints at a glance

| Endpoint | Cache | Notes |
|---|---|---|
| `GET /v1/vehicles` | 5 s | All buses |
| `GET /v1/arrivals` | 5 s | Upcoming arrivals for every stop |
| `GET /v1/static` | 1 day | Routes and stops; the app re-downloads only when `version` changes |
| `GET /v1/alerts` | 60 s | Service alerts |
| `POST /v1/plan` | none | Which bus to take between two points |
| `GET /v1/config` | 5 min | Banner, polling intervals, minimum app version |
| `GET /v1/health` | none | Backend and feed status |
| `POST /v1/feedback` | none | Forwards feedback to Discord |

The `Cache-Control: max-age=` header on each response is set by the Lambda and is how CloudFront knows how long to keep its copy.

---

## `GET /v1/vehicles`

Every bus currently reporting a position.

```json
{
  "updatedAt": 1794530133,
  "stale": false,
  "vehicles": [
    {
      "id": "13884",
      "routeId": "5647",
      "lat": 35.7688,
      "lon": -78.6780,
      "heading": 181,
      "occupancy": 2
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `id` | string | Vehicle id |
| `routeId` | string | Route the bus is serving. Matches `routes[].id` from `/v1/static`. |
| `lat`, `lon` | number | Current position |
| `heading` | integer | Degrees clockwise from north, 0–359 |
| `occupancy` | integer or null | GTFS-realtime `occupancy_status`: 0 empty, 1 many seats, 2 few seats, 3 standing room only, 4 crushed standing, 5 full, 6 not accepting passengers, 7 no data, 8 not boardable. `null` if the feed omits it. |

Source: Wolfline `vehiclePositions` feed. Updates about every 6 seconds. Size about 1 KB.

## `GET /v1/arrivals`

Upcoming arrivals for **every stop** in one response, so every phone and every stop shares a single cached copy.

```json
{
  "updatedAt": 1794530133,
  "stale": false,
  "stops": {
    "4510": [
      { "routeId": "5647", "arrivalAt": 1794530400, "source": "live" },
      { "routeId": "5649", "arrivalAt": 1794530760, "source": "scheduled" }
    ]
  }
}
```

| Field | Type | Notes |
|---|---|---|
| `stops` | object | Keys are stop ids. Each value is a list sorted by `arrivalAt`, soonest first. Stops with no arrivals are omitted. |
| `routeId` | string | Route serving this arrival |
| `arrivalAt` | integer | Expected arrival time, Unix seconds |
| `source` | string | `live`, `estimated` or `scheduled` (below) |

`source` tells the app how much to trust the time:

1. `live`: from Passio's live arrival endpoint.
2. `estimated`: our own estimate. How late the bus is right now (from `/v1/vehicles`), applied to the timetable.
3. `scheduled`: straight from the timetable. The app labels these "Scheduled."

The backend tries them in that order for each arrival. The public GTFS `tripUpdates` feed holds timetable times, not live predictions, so it only ever produces `scheduled`.

Size about 7 KB for all stops.

## `GET /v1/static`

Routes and stops. Changes about once a semester, so it is cached for a day and the app downloads it only when `version` changes.

```json
{
  "updatedAt": 1794500000,
  "stale": false,
  "version": "2026-11-16",
  "routes": [
    {
      "id": "5647",
      "shortName": "40",
      "longName": "Wolfline Route 40",
      "colorHex": "CC0000",
      "shape": "_p~iF~ps|U_ulLnnqC_mqNvxq`@"
    }
  ],
  "stops": [
    { "id": "4510", "name": "Hunt Library", "lat": 35.7695, "lon": -78.6765 }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `version` | string | Changes whenever the content changes. Compare it with the copy the app stored. |
| `routes[].colorHex` | string | Six hex digits, no `#`. From `route_color`. |
| `routes[].shape` | string | The route line as a Google-encoded polyline |
| `stops[].name` | string | As published by Wolfline |

Source: Wolfline `google_transit.zip` (`routes.txt`, `stops.txt`, `shapes.txt`). Note the feed expires monthly (`feed_end_date`), so the backend must refresh it.

## `GET /v1/alerts`

Active service alerts, shown as banners.

```json
{
  "updatedAt": 1794530100,
  "stale": false,
  "alerts": [
    {
      "id": "1021",
      "header": "Route 40 detour",
      "description": "Buses are using Western Blvd while Cates Ave is closed.",
      "startsAt": 1794500000,
      "endsAt": null
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `id` | string | Alert id |
| `header` | string | Short title |
| `description` | string | Body text. The backend strips the `p/` junk Passio adds. |
| `startsAt`, `endsAt` | integer or null | Active window. `null` means open-ended. |

Wolfline tags alerts to all of Wolfline, not to routes, so there is no `routeId` on an alert. Do not try to link alerts to routes.

## `POST /v1/plan`

Which bus to take, between two points. Walking directions are **not** here: the phone computes those itself with Apple Maps.

Request:

```json
{
  "from": { "lat": 35.7839, "lon": -78.6707 },
  "to":   { "lat": 35.7695, "lon": -78.6765 }
}
```

Response:

```json
{
  "updatedAt": 1794530133,
  "stale": false,
  "legs": [
    {
      "routeId": "5647",
      "boardStopId": "4510",
      "alightStopId": "4521",
      "stopCount": 6,
      "shape": "_p~iF~ps|U_ulLnnqC"
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `legs` | array | One entry per bus. More than one means a transfer. Empty if no bus trip exists. |
| `boardStopId`, `alightStopId` | string | Where to get on and off |
| `stopCount` | integer | Number of stops on this leg |
| `shape` | string | The part of the route line that this leg covers, as an encoded polyline |

No times. Passio's trip planner returned none when we tested it. The phone combines `legs` with `/v1/arrivals` to get "take Route 40 at 5:21".

Not cached: the request body varies per call.

## `GET /v1/config`

Switches the team can change without shipping a new app.

```json
{
  "updatedAt": 1794530000,
  "stale": false,
  "banner": null,
  "pollSeconds": { "vehicles": 5, "arrivals": 15, "alerts": 60 },
  "minAppVersion": "1.0.0",
  "features": {}
}
```

| Field | Type | Notes |
|---|---|---|
| `banner` | string or null | A message to show at the top of the app, such as "Wolfline is on the break schedule" |
| `pollSeconds` | object | How often each screen should refresh while visible |
| `minAppVersion` | string | Apps older than this should show an "update required" screen |
| `features` | object | Named on/off switches, empty for now |

## `GET /v1/health`

For checking the backend and the feed. Not cached, and not for the app's normal use.

```json
{
  "ok": true,
  "vehiclesAgeSeconds": 4,
  "staticVersion": "2026-11-16"
}
```

## `POST /v1/feedback`

Forwards a message to the team's Discord.

Request:

```json
{ "message": "The Route 40 bus was early", "appVersion": "1.0.0" }
```

Response: `204 No Content`. A request with an empty `message` gets `400`.

Not cached.

---

## Errors

Failures return a non-2xx status with this body, so the app can parse them one way:

```json
{ "error": { "code": "bad_request", "message": "from.lat is required" } }
```

| Status | `code` | When |
|---|---|---|
| 400 | `bad_request` | The request body is missing a field or has the wrong type |
| 404 | `not_found` | Unknown path |
| 502 | `upstream_failed` | Passio failed and there is nothing usable to return |
| 500 | `internal` | A bug on our side |

Error responses are never cached.

## Rules

- **Passio's shapes stay inside the backend.** Nothing in this document is a Passio field name, and the app never sees one.
- **Keep responses small.** The raw `tripUpdates.json` feed is about 3 MB. Never forward it to phones.
- **New fields are safe; renamed or removed fields are not.** Add a field to the shared models and the app ignores it until it needs it.

## Open questions

These are not decided. Decide them in an issue before building the endpoint that depends on them.

1. **Where does `stale` get its last good copy?** A Lambda keeps no state between calls. If Passio is down, either CloudFront serves its last cached copy (`stale-if-error`), or we store the last good response somewhere. Which one?
2. **Does `/v1/arrivals` cover every stop in one call to Passio's live endpoint?** Passio's `eta=3` endpoint accepts several stops, but nobody has tried all ~120 in one request.
3. **Route `shape` format.** Encoded polyline keeps `/v1/static` small. Is that decoding cost fine on the phone?
4. **Will stop and route ids change between semesters?** Unconfirmed. The permission email to NC State Transportation asks.
