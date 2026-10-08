import SwiftUI

/// The Route Detail screen: one route and the stops it's coming to.
/// Opens when you tap a route on Stop Detail or in Search.
///
/// 👉 Issue #17 — see the issue on GitHub for the specs and hints.
struct RouteDetailView: View {
    let route: Route

    var body: some View {
        // TODO (Issue #17): Replace this placeholder with the real screen.
        // `Arrival.on(route)` gives you this route's arrivals, soonest first.
        PlaceholderBox("RouteDetailView: \(route.name)")
    }
}

#Preview("Route 40") {
    NavigationStack {
        RouteDetailView(route: .sample40)
    }
}

#Preview("No buses") {
    NavigationStack {
        RouteDetailView(route: Route(id: "99", number: "99", name: "Ghost Route", color: .gray))
    }
}
