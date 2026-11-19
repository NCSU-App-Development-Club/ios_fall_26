import SwiftUI

/// The row of chips under "WHAT'S THIS ABOUT?". Tapping one selects it
/// and un-selects the others.
///
/// ```swift
/// CategoryPicker(selection: $category)
/// ```
///
/// - SeeAlso: GitHub issue #104 for the picture and specs.
struct CategoryPicker: View {
    /// The chosen category. It's a `@Binding`: the screen owns it, we only change it.
    @Binding var selection: FeedbackCategory

    var body: some View {
        // TODO (Issue #104): Replace this placeholder with the real picker.
        PlaceholderBox("CategoryPicker: \(selection.title)")
    }
}

#Preview {
    @Previewable @State var selection = FeedbackCategory.bug
    VStack(alignment: .leading) {
        CategoryPicker(selection: $selection)
        Text("Selected: \(selection.title)")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
    .padding()
    .background(Color.groupedBackground)
}
