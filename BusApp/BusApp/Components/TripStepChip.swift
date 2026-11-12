import SwiftUI

/// One pill in the walk → bus → walk row: [🚶 4 min] or [🚌 40 · 9 min]
/// The Time to Leave card shows one for each leg of the trip.
///
/// 👉 Issue #29 — see the issue on GitHub for the picture, specs, and hints.
struct TripStepChip: View {
    let step: TripStep
    
    private var icon: String {
        switch step.kind {
        case .walk: return "figure.walk"
        case .bus: return "bus"
        }
    }
    
    private var text: String {
        let time = ETAText(minutes: step.minutes).label
        switch step.kind {
        case .walk:
            return time
        case .bus(let route):
            return "\(route.number) · \(time)"
        }
    }
    
    private var background: Color {
        switch step.kind {
        case .walk:             return Color.groupedBackground
        case .bus(let route):   return route.color
        }
    }
    
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
