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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Spacing.s) {
                ForEach(FeedbackCategory.allCases) { category in
                    Button {
                        selection = category
                    } label: {
                        FeedbackCategoryChip(category: category, isSelected: category == selection)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
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
