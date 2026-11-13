import Foundation

/// A bus stop, e.g. "Dunn Ave @ Jeter Dr".
struct Stop: Identifiable, Hashable {
    /// Stable unique key, e.g. `"dunn-jeter"`.
    let id: String
    /// The stop's display name, e.g. "Dunn Ave @ Jeter Dr".
    let name: String
    /// How far away the stop is, in meters.
    /// Optional (`Int?`) because we won't always know the user's location.
    let distanceMeters: Int?
}
