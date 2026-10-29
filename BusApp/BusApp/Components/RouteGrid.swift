import SwiftUI

/// Every route as a tile, three to a row. The main part of the Routes screen.
///
/// 👉 Issue #47 — see the issue on GitHub for the picture, specs, and hints.
struct RouteGrid: View {
    /// One tile per status, in this order
    let statuses: [RouteStatus]
    /// What happens when a tile is tapped. You're given the route that was tapped.
    let onSelect: (Route) -> Void

    var body: some View {
        // TODO (Issue #47): Replace this placeholder with the real grid.
        // Reuse SavedRouteTile (#31). Don't rebuild it!
        PlaceholderBox("RouteGrid: \(statuses.count) routes")
    }
}

#Preview {
    ScrollView {
        RouteGrid(statuses: RouteStatus.samples) { route in
            print("Tapped \(route.number)")
        }
        .padding()
    }
    .background(Color.groupedBackground)
}
