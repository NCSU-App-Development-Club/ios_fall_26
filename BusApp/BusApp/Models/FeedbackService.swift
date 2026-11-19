import Foundation

/// A pretend server for feedback, so the screen has something to "send" to.
/// It waits a moment, like a real network call, then succeeds.
///
/// **To see the failed state:** put the word `fail` anywhere in your message.
/// (The real backend comes later; this file is the only thing that changes then.)
enum FeedbackService {
    struct SendError: LocalizedError {
        var errorDescription: String? { "Couldn't send. Check your connection and try again." }
    }

    /// Pretends to send feedback. Takes about a second. Throws if the message contains "fail".
    static func send(category: FeedbackCategory, message: String, includesContext: Bool) async throws {
        try await Task.sleep(for: .seconds(1))
        if message.localizedCaseInsensitiveContains("fail") {
            throw SendError()
        }
    }
}
