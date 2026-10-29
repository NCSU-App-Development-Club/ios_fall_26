import SwiftUI
import MapKit

/// The campus map on the Routes screen, with every route's line, its stops, and its buses drawn on top.
///
/// 👉 Issue #48 — see the issue on GitHub for the picture, specs, and hints.
struct RoutesMap: View {
    let lines: [RouteLine]

    var body: some View {
        // TODO (Issue #48): Replace this placeholder with a real Map.
        // Reuse BusMarker and StopDot for the buses and stops.
        PlaceholderBox("RoutesMap: \(lines.count) routes")
    }
}

#Preview {
    RoutesMap(lines: RouteLine.samples)
}
