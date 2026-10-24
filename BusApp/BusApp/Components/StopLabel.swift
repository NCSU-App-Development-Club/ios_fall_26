import SwiftUI

/// A bus stop's name with a pin icon, and how far away it is (if we know).
/// Used anywhere the app shows a stop.
///
/// 👉 Issue #3 — see the issue on GitHub for the wireframe, specs, and hints.
struct StopLabel: View {
    let stop: Stop

    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .foregroundStyle(Color.ncsuRed)
            VStack(alignment: .leading) {
                Text(stop.name)
                    .font(.headline)
                if let distance = stop.distanceMeters {
                    Text("\(distance) m away")
                        .font(Font.footnote.monospacedDigit())
                        .foregroundStyle(Color(.secondaryLabel))
                }
            }
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
