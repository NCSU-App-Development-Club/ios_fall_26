import SwiftUI

/// What the Feedback sheet shows after your message goes through:
/// a big check, "Thanks!", and a Done button.
///
/// - SeeAlso: GitHub issue #108 for the picture and specs.
struct FeedbackSentView: View {
    /// What Done does. Feedback passes in "close the sheet".
    var onDone: () -> Void = {}

    var body: some View {
        // TODO (Issue #108): Replace this placeholder with the real "Thanks!" view.
        PlaceholderBox("FeedbackSentView")
    }
}

#Preview {
    FeedbackSentView()
        .padding()
        .background(Color.groupedBackground)
}
