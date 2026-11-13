import SwiftUI

/// A small colored badge showing a route number, e.g. [ 40 ].
///
/// Used anywhere the app mentions a bus route. The background is the route's
/// own color and the number uses ``Route/textColor`` (white, or black on yellow).
///
/// ```swift
/// RouteBadge(route: .sample40)
/// ```
///
/// - Author: Jonathan Sawyer
/// - SeeAlso: GitHub issue #2 for the wireframe and specs.
struct RouteBadge: View {
    /// The route to show. Supplies the number text and the background color.
    let route: Route

    var body: some View {
        Text(route.number)
            .font(.title3.bold())
            .foregroundStyle(route.textColor)
            .padding(.horizontal, Spacing.ms)
            .padding(.vertical, Spacing.xs)
            .background(route.color, in: RoundedRectangle(cornerRadius: Radius.badge))
    }
}

#Preview {
    VStack(spacing: Spacing.m) {
        RouteBadge(route: .sample40)
        RouteBadge(route: .sample41)
        RouteBadge(route: .sample3)
        RouteBadge(route: .sampleLong)
    }
    .padding()
}
