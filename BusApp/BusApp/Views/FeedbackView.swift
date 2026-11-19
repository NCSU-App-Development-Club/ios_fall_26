import SwiftUI

/// The Feedback screen: a "Send Feedback" title with an X, a row of category chips,
/// a message box, an "include route and location" switch, and a Send button.
/// It slides up over Home when you tap the ⓘ button.
///
/// 👉 Issue #110 — see the issue on GitHub for the picture, specs, and hints.
///    Every component this screen uses has its own issue (#102 lists them).
///    Build this one last: you only arrange components here, you don't restyle them.
struct FeedbackView: View {
    /// What the X button (and Done) does. Home passes in "close Feedback" (#109).
    var onClose: () -> Void = {}

    // The screen owns all the state and hands each component what it needs.
    @State private var category = FeedbackCategory.bug
    @State private var message = ""
    @State private var includesContext = true
    @State private var status = FeedbackStatus.idle

    var body: some View {
        // TODO (Issue #110): Replace this placeholder with the real screen.
        PlaceholderBox("FeedbackView")
    }

    /// True when there's nothing but spaces in the message box. Sending is off then.
    private var isEmpty: Bool {
        message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /// Pretends to send the feedback (see `FeedbackService`) and moves `status` along:
    /// sending → sent, or sending → failed. It's written for you; your job is to call it.
    private func send() {
        status = .sending
        Task {
            do {
                try await FeedbackService.send(category: category, message: message, includesContext: includesContext)
                status = .sent
            } catch {
                status = .failed(error.localizedDescription)
            }
        }
    }
}

#Preview {
    FeedbackView()
        .background(Color.groupedBackground)
}

#Preview("As a sheet") {
    Color.gray
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            FeedbackView()
                .presentationBackground(Color.groupedBackground)
        }
}
