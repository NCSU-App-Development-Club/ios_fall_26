import SwiftUI

/// The Stop Detail screen: every bus coming to one stop.
/// Opens when you tap a stop on Home or in Search.
///
/// 👉 Issue #16 — see the issue on GitHub for the specs and hints.
struct StopDetailView: View {
    let stop: Stop

    var body: some View {
        // TODO (Issue #16): Replace this placeholder with the real screen.
        // `Arrival.at(stop)` gives you this stop's arrivals, soonest first.
        PlaceholderBox("StopDetailView: \(stop.name)")
    }
}

#Preview("Busy stop") {
    NavigationStack {
        StopDetailView(stop: .sampleNear)
    }
}

#Preview("No buses") {
    NavigationStack {
        StopDetailView(stop: Stop(id: "empty", name: "Quiet Corner", distanceMeters: 300))
    }
}
