import SwiftUI

/// The big card at the top of Home: when to leave for your next class, and how to get there.
///   TIME TO LEAVE                     MA 242 · 3:00 PM
///   Leave in 6 min                          [ Go ]
///   Route 40 · Dunn Ave @ Jeter Dr
///   [🚶 4 min] › [🚌 40 · 9 min] › [🚶 2 min]
///
/// 👉 Issue #30 — see the issue on GitHub for the picture, specs, and hints.
struct TimeToLeaveCard: View {
    let trip: TimeToLeave
    /// What happens when "Go" is tapped
    let onGo: () -> Void

    var body: some View {
        // TODO (Issue #30): Replace this placeholder with the real card.
        PlaceholderBox("TimeToLeaveCard: \(trip.className)")
    }
}

#Preview {
    VStack(spacing: Spacing.m) {
        TimeToLeaveCard(trip: .sample) {}
        TimeToLeaveCard(trip: .sampleNow) {}
    }
    .padding()
    .background(Color.groupedBackground)
}
