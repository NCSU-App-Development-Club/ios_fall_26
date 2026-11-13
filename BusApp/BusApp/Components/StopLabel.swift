import SwiftUI

/// A bus stop's name with a pin icon, and how far away it is (if we know).
/// Used anywhere the app shows a stop.
///
/// - SeeAlso: GitHub issue #3 for the wireframe and specs.
struct StopLabel: View {
    let stop: Stop

    var body: some View {
        // TODO (Issue #3): Replace this placeholder with the real label.
        // Careful: stop.distanceMeters is an Optional (Int?) — it can be nil!
        PlaceholderBox("StopLabel: \(stop.name)")
    }
}

#Preview {
    VStack(alignment: .leading, spacing: Spacing.m) {
        StopLabel(stop: .sampleNear)
        StopLabel(stop: .sampleFar)
        StopLabel(stop: .sampleNoDistance)
    }
    .padding()
}
