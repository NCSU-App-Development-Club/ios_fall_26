import SwiftUI

/// The small white dot with a colored ring that marks a bus stop on the map.
///
/// - SeeAlso: GitHub issue #44 for the picture and specs.
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
