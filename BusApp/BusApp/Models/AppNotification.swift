import Foundation

/// One message on the Notifications screen, e.g. "Route 40 is dwelling".
///
/// Why not just `Notification`? Swift already has a type with that name (for something else),
/// and two types with the same name make confusing errors. So ours is `AppNotification`.
struct AppNotification: Identifiable, Hashable {
    /// What the notification is about. Decides its icon and color.
    enum Kind: Hashable {
        /// A bus is holding at a stop. The route rides along with the case.
        case dwelling(Route)
        /// A bus started moving again.
        case moving(Route)
        /// Time to leave for class (FR-20).
        case timeToLeave
    }

    let id: String
    let kind: Kind
    /// The bold line, e.g. "Route 40 is dwelling"
    let title: String
    /// The gray text under it. Can be long: it wraps.
    let message: String
    /// When it arrived
    let date: Date

    /// Whole minutes since it arrived, e.g. 3. Never negative.
    var minutesAgo: Int {
        max(0, Int(Date.now.timeIntervalSince(date) / 60))
    }
}
