import SwiftUI

// MARK: - Theme
//
// One place for the app's colors, spacing, and corner radii.
// Components should read from here instead of hardcoding values,
// so when we redesign the app we change THIS file, not every component.

extension Color {
    /// NC State "Wolfpack Red" (#CC0000)
    static let ncsuRed = Color(red: 204 / 255, green: 0, blue: 0)

    /// Route colors used by the sample data.
    static let routeBlue   = Color(red: 0.00, green: 0.45, blue: 0.85)
    static let routeGreen  = Color(red: 0.13, green: 0.55, blue: 0.13)
    static let routeOrange = Color(red: 0.93, green: 0.49, blue: 0.00)
}

/// Spacing scale (multiples of 4/8). Use these for padding and stack spacing.
enum Spacing {
    static let xs: CGFloat = 4
    static let s:  CGFloat = 8
    static let m:  CGFloat = 16
    static let l:  CGFloat = 24
}

/// Corner radii.
enum Radius {
    static let small: CGFloat = 6
    static let card:  CGFloat = 16
}
