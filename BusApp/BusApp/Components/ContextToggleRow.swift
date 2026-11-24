import SwiftUI

/// A white row with a title and gray note on the left and an on/off switch on the right:
///   Include route and location                    (●  )
///   Helps us reproduce the issue
///
/// - SeeAlso: GitHub issue #106 for the picture and specs.
struct ContextToggleRow: View {
    let title: String
    let subtitle: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(isOn: $isOn) {
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, Spacing.m)
        .padding(.vertical, Spacing.ms)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.tile))
    }
}

#Preview {
    @Previewable @State var isOn = true
    ContextToggleRow(title: "Include route and location", subtitle: "Helps us reproduce the issue", isOn: $isOn)
        .padding()
        .background(Color.groupedBackground)
}

#Preview("Long text") {
    @Previewable @State var isOn = false
    ContextToggleRow(
        title: "Include the route you were on and your current location",
        subtitle: "This helps us reproduce the problem you ran into, and we never share it.",
        isOn: $isOn
    )
    .padding()
    .background(Color.groupedBackground)
}
