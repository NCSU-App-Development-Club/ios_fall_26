import SwiftUI

/// A small colored badge showing a route number, e.g. [ 40 ].
/// Used anywhere the app mentions a bus route.
///
/// 👉 Issue #2 — see the issue on GitHub for the wireframe, specs, and hints.
struct RouteBadge: View {
    let route: Route

    var body: some View {
        Text(route.number)
            .bold()
            .padding()
            .foregroundStyle(.white)
            .background(route.color, in: RoundedRectangle(cornerRadius: Radius.small))
            .foregroundStyle(.white)

    }

}

#Preview {
    HStack(spacing: Spacing.m) {
        RouteBadge(route: .sample40)
        RouteBadge(route: .sample41)
        RouteBadge(route: .sample3)
        RouteBadge(route: .sampleLong)
    }
    .padding()
}
