import SwiftUI

/// One pill in the walk → bus → walk row: [🚶 4 min] or [🚌 40 · 9 min]
/// The Time to Leave card shows one for each leg of the trip.
///
/// 👉 Issue #29 — see the issue on GitHub for the picture, specs, and hints.
struct TripStepChip: View {
    let step: TripStep

    var body: some View {
        // TODO (Issue #29): Replace this placeholder with the real chip.
        // Hint: step.kind is an enum, so a `switch` decides what to show.
        PlaceholderBox("TripStepChip: \(step.minutes) min")
    }
}

#Preview {
    HStack(spacing: Spacing.s) {
        ForEach(TripStep.samples) { step in
            TripStepChip(step: step)
        }
    }
    .padding()
}
