import SwiftUI

/// A section title with an optional button on the right:
///   Nearby stops                See all
/// Home and other screens use this above each group of cards.
///
/// 👉 Issue #15 — see the issue on GitHub for the specs and hints.
struct SectionHeader: View {
    let title: String
    /// The button's words, e.g. "See all". Leave it out for no button.
    var actionTitle: String? = nil
    /// What happens when the button is tapped.
    var action: (() -> Void)? = nil

    var body: some View {
        // TODO (Issue #15): Replace this placeholder with the real header.
        PlaceholderBox("SectionHeader: \(title)")
    }
}

#Preview("With button") {
    SectionHeader(title: "Nearby stops", actionTitle: "See all") {
        print("See all tapped")
    }
    .padding()
}

#Preview("No button") {
    SectionHeader(title: "Favorites")
        .padding()
}
