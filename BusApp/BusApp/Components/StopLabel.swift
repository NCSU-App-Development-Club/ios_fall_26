import SwiftUI

/// A bus stop's name with a pin icon, and how far away it is (if we know).
/// Used anywhere the app shows a stop.
///
/// 👉 Issue #3 — see the issue on GitHub for the wireframe, specs, and hints.
struct StopLabel: View {
    let stop: Stop

    var body: some View {
        // TODO (Issue #3): Replace this placeholder with the real label.
        // Careful: stop.distanceMeters is an Optional (Int?) — it can be nil!
        VStack(spacing: 2) {
            Label {
                Text(stop.name)
                    .bold()
            } icon: {
                Image(systemName: "mappin.circle.fill")
                    .foregroundStyle(Color.ncsuRed)
            }
            
            if let distance = stop.distanceMeters {
                Text("\(distance) m away")
                    .font(Font.footnote.monospacedDigit())
                    .foregroundStyle(Color(.secondaryLabel))
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .background(Color.red.opacity(0.3), in: RoundedRectangle(cornerRadius: Radius.small))
        .overlay {
            RoundedRectangle(cornerRadius: Radius.small)
                .strokeBorder(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.primary)
        }
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
