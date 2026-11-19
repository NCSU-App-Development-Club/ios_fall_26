import SwiftUI

/// One pill in the walk → bus → walk row: [🚶 4 min] or [🚌 40 · 9 min]
///
/// The Time to Leave card shows one for each leg of the trip. Walking legs are
/// gray with dark text; bus legs use the route's color with white text.
///
/// - SeeAlso: GitHub issue #29 for the picture and specs.
struct TripStepChip: View {
    /// The leg of the trip to show.
    let step: TripStep

    /// SF Symbol for the leg: a walking figure or a bus.
    private var icon: String {
        switch step.kind {
        case .walk: return "figure.walk"
        case .bus: return "bus"
        }
    }

    /// The chip's words, e.g. `"4 min"` or `"40 · 9 min"`.
    private var text: String {
        let time = ETAText(minutes: step.minutes).label
        switch step.kind {
        case .walk:
            return time
        case .bus(let route):
            return "\(route.number) · \(time)"
        }
    }

    /// Pill fill: gray for walking, the route's color for a bus.
    private var background: Color {
        switch step.kind {
        case .walk:             return Color.groupedBackground
        case .bus(let route):   return route.color
        }
    }

    /// Icon and text color, chosen to read well on ``background``.
    private var foreground: Color {
        switch step.kind {
        case .walk: return Color.primary
        case .bus: return Color.white
        }
    }

    var body: some View {
        HStack(spacing: Spacing.xs) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.footnote.weight(.medium))
        .foregroundStyle(foreground)
        .padding(.horizontal, Spacing.s)
        .padding(.vertical, Spacing.xs)
        .background(background, in: Capsule())
    }
}

#Preview {
    HStack(spacing: Spacing.s) {
        ForEach(Array(TripStep.samples.enumerated()), id: \.element.id) { index, step in
            TripStepChip(step: step)

            if index < TripStep.samples.count - 1 {
                Image(systemName: "chevron.right")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(.secondary)
            }
        }
    }
    .padding()
}
