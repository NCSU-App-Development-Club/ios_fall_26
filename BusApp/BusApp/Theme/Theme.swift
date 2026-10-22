import SwiftUI

// MARK: - Theme
//
// One place for the app's colors, spacing, and corner radii.
// Components should read from here instead of hardcoding values,
// so when we redesign the app we change THIS file, not every component.
//
// Values match the Figma wireframes ("iOS Bus App Wireframes").

extension Color {
    /// NC State "Wolfpack Red" (#CC0000)
    static let ncsuRed = Color(red: 204 / 255, green: 0, blue: 0)

    /// Route colors used by the sample data.
    static let routeBlue   = Color(red: 0.00, green: 0.45, blue: 0.85)
    static let routeGreen  = Color(red: 0.13, green: 0.55, blue: 0.13)
    /// Figma "route/bio-indigo" (#4156A1)
    static let routeIndigo = Color(red: 65 / 255, green: 86 / 255, blue: 161 / 255)
    /// Figma "route/carmichael-aqua" (#008473)
    static let routeAqua   = Color(red: 0, green: 132 / 255, blue: 115 / 255)
    /// Figma "route/flame-orange" (#D14905)
    static let routeOrange = Color(red: 209 / 255, green: 73 / 255, blue: 5 / 255)

    // These two are Apple's system colors instead of fixed numbers, so they turn dark in Dark Mode.
    // (A fixed white card in Dark Mode gets white text on a white background.)

    /// Fill for cards and tiles. White in light mode (Figma "bg/card")
    static let cardBackground = Color(.secondarySystemGroupedBackground)
    /// Light gray behind cards, and for gray chips and icon circles. #F2F2F7 in light mode (Figma "bg/grouped")
    static let groupedBackground = Color(.systemGroupedBackground)
    /// The little "live" dot next to arrival times (Figma "system/live-green", #34C759)
    static let liveGreen = Color(red: 52 / 255, green: 199 / 255, blue: 89 / 255)
}

/// Spacing scale (multiples of 4/8). Use these for padding and stack spacing.
enum Spacing {
    static let xs: CGFloat = 4
    static let s:  CGFloat = 8
    /// Between s and m: the gap between rows inside a card, and the padding inside a tile
    static let ms: CGFloat = 12
    static let m:  CGFloat = 16
    static let l:  CGFloat = 24
}

/// Corner radii.
///
/// Pills (chips, the Go button, the search field, the Routes button) don't use a
/// number at all: they're fully round, so use `Capsule()`. Round icon backgrounds use `Circle()`.
enum Radius {
    /// Placeholder boxes
    static let small: CGFloat = 6
    /// Route number badges, e.g. [40]
    static let badge: CGFloat = 8
    /// Saved Route tiles
    static let tile:  CGFloat = 20
    /// Big cards: Time to Leave, the Recents list
    static let card:  CGFloat = 24
}
