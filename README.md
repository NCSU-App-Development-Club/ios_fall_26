# Wolfpack Bus — iOS (App Dev Club, Fall 2026)

The iOS team's bus app for NC State: live arrivals, time-to-leave alerts, crowd levels, and more — built together, one GitHub issue at a time.

## Run the app

1. Install **Xcode 26** (Mac App Store).
2. Clone this repo (Xcode → **Integrate → Clone…** → paste `https://github.com/NCSU-App-Development-Club/ios_fall_26.git`).
3. Open `BusApp/BusApp.xcodeproj`.
4. Pick an iPhone simulator at the top of the window and press **⌘R**.

You should see the **Components** gallery. Gray dashed boxes are components nobody has built yet — that's what the issues are for.

## Picking up an issue

1. Open the [project board](../../projects) and pick an issue from **Ready** (`beginner` or `intermediate`). Assign yourself and move it to **In progress**.
2. **Switch to the issue's branch.** Every issue tells you its branch name, e.g. `issue-2-route-badge`.
   - Xcode: **Source Control → Fetch Changes**, then open the Source Control navigator (⌘2), expand **Remotes → origin**, right-click your branch → **Checkout…**
   - Terminal: `git fetch` then `git switch issue-2-route-badge`
3. Open the file the issue names. Turn on the canvas (**⌥⌘↩**) so you see your preview live.
4. Build it. Run it (**⌘R**). Break it, fix it.
5. **Commit:** Source Control → Commit… → check only your file → write a message like `Build RouteBadge` → Commit.
6. **Push:** Source Control → Push… (make sure it's pushing your issue branch, **not** `main`).
7. **Open a Pull Request** on GitHub: you'll see a yellow "Compare & pull request" banner. Fill in the template (add a screenshot!) and write `Closes #2` (your issue number).
8. Move your issue to **Done** once your PR is opened. Manish reviews and merges.

## Rules for components (why they're built this way)

These components get reused on screens we haven't designed yet, so:

- **No hardcoded data.** Show what's passed in (`route.number`), never `"40"`.
- **No outer padding, background, or fixed width on the whole component.** The screen that uses it decides where it goes.
- **Colors and sizes come from `Theme.swift`** (`Color.ncsuRed`, `Spacing.m`, `Radius.card`).
- **Your `#Preview` shows every state** (every route, every crowd level, etc.).

## Project layout

```
BusApp/BusApp/
├── Theme/        colors, spacing, radii
├── Models/       Route, Stop, CrowdLevel + fake sample data
├── Components/   one reusable view per file (one per issue)
├── Gallery/      ComponentGallery — shows every component
└── ContentView   the app's root
```

## Handy Xcode shortcuts

| Shortcut | What it does |
|---|---|
| ⌘R | Build and run |
| ⌘B | Build only |
| ⌥⌘↩ | Show/hide the preview canvas |
| ⌥-click a name | Quick Help — what it is and what parameters it takes |
| ⌃⌘Space | Emoji picker |
| ⌘⇧K | Clean build folder (try this when things are weird) |
