import SwiftUI

/// A small colored badge showing a route number, e.g. [ 40 ].
/// Used anywhere the app mentions a bus route.
///
/// 👉 Issue #2 — see the issue on GitHub for the wireframe, specs, and hints.
struct RouteBadge: View {
    let route: Route

    var body: some View {
        // TODO (Issue #2): Replace this placeholder with the real badge.
        // Use route.number for the text and route.color for the background.
        PlaceholderBox("RouteBadge \(route.number)")
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
