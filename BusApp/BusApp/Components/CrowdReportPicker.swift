import SwiftUI

/// Three buttons a rider taps to report how full a bus is:
///   [ Empty ]  [ Some seats ]  [ Full ]
/// The chosen one is highlighted. Tapping it again clears the choice.
///
/// 👉 Issue #20 — see the issue on GitHub for the wireframe, specs, and hints.
struct CrowdReportPicker: View {
    /// The rider's choice. `nil` means they haven't picked one yet.
    /// It's a Binding (like SearchBar's text), so the screen using
    /// this picker always knows what was chosen.
    @Binding var selection: CrowdLevel?

    var body: some View {
        // TODO (Issue #20): Replace this placeholder with the real picker.
        // Hint: `CrowdLevel.allCases` is every level, in order.
        HStack(spacing: Spacing.s) {
            ForEach(CrowdLevel.allCases) { level in
                let isSelected = selection == level
                
                Button {
                    selection = (selection == level) ? nil: level
                } label: {
                    Text(level.rawValue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(isSelected ? Color.white: Color.primary)
                        .background(isSelected ? Color.ncsuRed: Color(.quaternarySystemFill), in: RoundedRectangle(cornerRadius: Radius.small))
                }

                .buttonStyle(.plain)
                .accessibilityAddTraits(isSelected ? .isSelected : [])
            }
        }
        .sensoryFeedback(.selection, trigger: selection)

    }
}

#Preview("Nothing picked") {
    @Previewable @State var selection: CrowdLevel? = nil
    VStack(spacing: Spacing.m) {
        CrowdReportPicker(selection: $selection)
        Text("Picked: \(selection?.rawValue ?? "nothing")")
            .foregroundStyle(.secondary)
    }
    .padding()
}

#Preview("Full picked") {
    @Previewable @State var selection: CrowdLevel? = .full
    CrowdReportPicker(selection: $selection)
        .padding()
}
