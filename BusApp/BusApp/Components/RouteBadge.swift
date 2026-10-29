import SwiftUI

/// A small colored badge showing a route number, e.g. [ 40 ].
/// Used anywhere the app mentions a bus route.
/// -Author: Jonathan Sawyer
/// 👉 Issue #2 — see the issue on GitHub for the wireframe, specs, and hints.
struct RouteBadge: View {
    let route: Route

    var body: some View {
        Text(route.number)
            .bold()
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .foregroundStyle(.white)
            .background(route.color, in: RoundedRectangle(cornerRadius: Radius.badge))
            .foregroundStyle(.white)
            .font(.title3.bold())

    }

}

struct SavedRouteCard: View {
    let route: Route
    let minutes: Int
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                RouteBadge(route: route)

                Text(route.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    Circle()
                        .fill(.green)
                        .frame(width: 6, height: 6)
                    Text("\(minutes) min")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(Spacing.s)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white, in: RoundedRectangle(cornerRadius: 24))
            .shadow(color: .black.opacity(0.08), radius: 6, y: 2)
        }
}

struct SavedRoutesSection: View {
    let items: [(route: Route, minutes: Int)]

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            HStack {
                Text("Saved Routes")
                    .font(.title2.bold())
                Spacer()
                Button("See All") { }
                    .foregroundStyle(.red)
            }

            HStack(spacing: Spacing.m) {
                ForEach(items.indices, id: \.self) { i in
                    SavedRouteCard(route: items[i].route, minutes: items[i].minutes)
                }
            }
        }
    }
}

#Preview {
    SavedRoutesSection(items: [
        (.sample40, 4),
        (.sample41, 9),
        (.sample3, 12)
    ])
    .padding()
}
