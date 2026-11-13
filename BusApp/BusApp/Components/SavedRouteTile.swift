import SwiftUI

/// A small tile for one saved route: its badge, its name, and when the next bus comes.
///
/// ```
/// [30]
/// Wolf Village
/// • 4 min
/// ```
///
/// Built from ``RouteBadge`` and ``ETAText``. The dot is green while the next
/// bus is 30 minutes away or less, and gray after that.
///
/// - SeeAlso: GitHub issue #31 for the picture and specs.
struct SavedRouteTile: View {
    /// The route to show.
    let route: Route
    /// Minutes until the next bus on this route
    let minutes: Int

    /// Green "live" dot for buses coming soon, gray for ones far off.
    private var dotColor: Color {
        minutes > 30 ? Color.secondary : Color.liveGreen
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            RouteBadge(route: route)

            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text(route.name)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)

                HStack(spacing: Spacing.xs) {
                    Circle()
                        .fill(dotColor)
                        .frame(width: 6, height: 6)

                    ETAText(minutes: minutes)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(Spacing.ms)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.tile))
    }
}

#Preview {
    HStack(spacing: Spacing.s) {
        SavedRouteTile(route: .sample30, minutes: 4)
        SavedRouteTile(route: .sample40, minutes: 9)
        SavedRouteTile(route: .sample20, minutes: 12)
        SavedRouteTile(route: .sample41, minutes: 45)
    }
    .padding()
    .background(Color.groupedBackground)
}
