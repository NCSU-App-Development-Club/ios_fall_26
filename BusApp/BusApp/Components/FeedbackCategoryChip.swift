import SwiftUI

/// One pill in the "What's this about?" row: Bug, Idea, Route info, Other.
/// Red with white text when selected, white with dark text when not.
///
/// - SeeAlso: GitHub issue #103 for the picture and specs.
struct FeedbackCategoryChip: View {
    let category: FeedbackCategory
    let isSelected: Bool

    var body: some View {
        Text(category.title)
            .foregroundStyle(isSelected ? .white : .primary)
            .font(.subheadline.weight(.medium))
            .padding(.horizontal, Spacing.m)
            .padding(.vertical, 9)
            .background(isSelected ? Color.ncsuRed : Color.cardBackground, in: Capsule())
    }
}



#Preview("Selected and not") {
    HStack(spacing: Spacing.s) {
        FeedbackCategoryChip(category: .bug, isSelected: true)
        FeedbackCategoryChip(category: .idea, isSelected: false)
    }
    .padding()
    .background(Color.groupedBackground)
}

#Preview("Every category") {
    HStack(spacing: Spacing.s) {
        ForEach(FeedbackCategory.allCases) { category in
            FeedbackCategoryChip(category: category, isSelected: category == .routeInfo)
        }
    }
    .padding()
    .background(Color.groupedBackground)
}
