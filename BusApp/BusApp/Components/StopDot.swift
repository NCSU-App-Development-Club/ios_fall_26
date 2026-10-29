import SwiftUI

/// The small white dot with a colored ring that marks a bus stop on the map.
///
/// 👉 Issue #44 — see the issue on GitHub for the picture, specs, and hints.
struct StopDot: View {
    /// The ring's color: the route this stop is on
    let color: Color

    var body: some View {
        // TODO (Issue #44): Replace this placeholder with the real dot.
        PlaceholderBox("StopDot")
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        StopDot(color: .routeIndigo)
        StopDot(color: .routeAqua)
        StopDot(color: .routeOrange)
    }
    .padding()
    .background(Color.groupedBackground)
}
