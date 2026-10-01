import Foundation

/// A bus stop, e.g. "Dunn Ave @ Jeter Dr".
struct Stop: Identifiable, Hashable {
    let id: String
    let name: String
    /// How far away the stop is, in meters.
    /// Optional (`Int?`) because we won't always know the user's location.
    let distanceMeters: Int?
}
