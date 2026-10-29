import SwiftUI

/// A bus on the map: a circle in the route's color with a white bus icon and a white ring.
///
/// 👉 Issue #45 — see the issue on GitHub for the picture, specs, and hints.
struct BusMarker: View {
    let route: Route

    var body: some View {
        // TODO (Issue #45): Replace this placeholder with the real marker.
        PlaceholderBox("BusMarker \(route.number)")
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        BusMarker(route: .sample30)
        BusMarker(route: .sample40)
        BusMarker(route: .sample60)
    }
    .padding()
    .background(Color.groupedBackground)
}
