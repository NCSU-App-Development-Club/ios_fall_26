import Foundation

/// Everything the "Time to Leave" card on Home needs:
/// when to leave for the next class, and which bus gets you there.
/// Later this comes from the user's calendar (FR-20). For now, use `TimeToLeave.sample`.
struct TimeToLeave: Hashable {
    /// The class, e.g. "MA 242"
    let className: String
    /// When the class starts, e.g. "3:00 PM"
    let classTime: String
    /// Minutes until the user should leave. 0 means leave now.
    let leaveInMinutes: Int
    let route: Route
    /// The stop to catch the bus at
    let stop: Stop
    /// Walk → bus → walk
    let steps: [TripStep]
}
