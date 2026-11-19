import Foundation

/// What a piece of feedback is about. The four chips on the Feedback screen.
///
/// `CaseIterable` gives us `FeedbackCategory.allCases`, so a `ForEach` can make one chip per case.
enum FeedbackCategory: String, CaseIterable, Identifiable {
    case bug
    case idea
    case routeInfo
    case other

    var id: String { rawValue }

    /// The words on the chip: "Bug", "Idea", "Route info", "Other"
    var title: String {
        switch self {
        case .bug:       "Bug"
        case .idea:      "Idea"
        case .routeInfo: "Route info"
        case .other:     "Other"
        }
    }

    /// The gray hint inside the message box. It changes with the chip.
    var placeholder: String {
        switch self {
        case .bug:       "Describe what happened…"
        case .idea:      "What would make the app better?"
        case .routeInfo: "Which route or stop looks wrong?"
        case .other:     "What's on your mind?"
        }
    }
}
