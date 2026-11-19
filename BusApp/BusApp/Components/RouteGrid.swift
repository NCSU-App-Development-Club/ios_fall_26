import SwiftUI

/// Every route as a tile, three to a row. The main part of the Routes screen.
///
/// Routes with no bus right now (a status whose `minutes` is `nil`) still get
/// a tile; ``SavedRouteTile`` shows them as "— min".
///
/// - SeeAlso: GitHub issue #47 for the picture and specs.
struct RouteGrid: View {
    /// One tile per status, in this order
    let statuses: [RouteStatus]
    /// What happens when a tile is tapped. You're given the route that was tapped.
    let onSelect: (Route) -> Void
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: Spacing.s), count: 3)

    var body: some View {
        LazyVGrid(columns: columns, spacing: Spacing.s) {
            ForEach(statuses) { status in
                Button {
                    onSelect(status.route)
                } label: {
                    SavedRouteTile(route: status.route, minutes: status.minutes)
                }
                .buttonStyle(.plain)
            }
        }
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
