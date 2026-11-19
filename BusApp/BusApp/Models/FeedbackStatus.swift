import Foundation

/// Where a piece of feedback is in its trip to us. The Feedback screen shows a
/// different thing for each one.
enum FeedbackStatus: Equatable {
    /// Nothing sent yet: the form is open for typing.
    case idle
    /// On its way: the Send button shows a spinner.
    case sending
    /// Delivered: the screen shows "Thanks!".
    case sent
    /// It didn't go through: show the reason and let them try again.
    case failed(String)
}
