import SwiftUI

/// A small tile for one saved route: its badge, its name, and when the next bus comes.
///   [30]
///   Wolf Village
///   • 4 min
///
/// 👉 Issue #31 — see the issue on GitHub for the picture, specs, and hints.
struct SavedRouteTile: View {
    let route: Route
    /// Minutes until the next bus on this route
    let minutes: Int

    var body: some View {
        // TODO (Issue #31): Replace this placeholder with the real tile.
        // Reuse RouteBadge (#2) and ETAText (#6). Don't rebuild them!
        PlaceholderBox("SavedRouteTile: \(route.number)")
    }
}

#Preview {
    HStack(spacing: Spacing.s) {
        SavedRouteTile(route: .sample30, minutes: 4)
        SavedRouteTile(route: .sample40, minutes: 9)
        SavedRouteTile(route: .sample20, minutes: 12)
    }
    .padding()
    .background(Color.groupedBackground)
}
