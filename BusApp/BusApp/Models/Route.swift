import SwiftUI

/// A bus route, e.g. route "40" (Wolfline) shown in blue.
struct Route: Identifiable, Hashable {
    let id: String
    /// Short label shown on the badge, e.g. "40"
    let number: String
    /// Full name, e.g. "Wolfline 40 — Centennial"
    let name: String
    /// The route's color
    let color: Color
}
