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
/// When no bus is running on the route, pass `nil` for ``minutes``. The tile
/// then shows "— min" with no dot:
///
/// ```
/// [?]
/// Name TBD
/// — min
/// ```
///
/// - SeeAlso: GitHub issue #31 for the picture and specs, and issue #46 for
///   the no-bus state.
struct SavedRouteTile: View {
    /// The route to show.
    let route: Route
    /// Minutes until the next bus on this route. `nil` means no bus is
    /// running right now.
    let minutes: Int?

    /// Green "live" dot for buses coming soon, gray for ones far off.
    /// Gray when there's no bus, though the dot isn't drawn then.
    private var dotColor: Color {
        guard let minutes else { return Color.secondary }
        return minutes > 30 ? Color.secondary : Color.liveGreen
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            RouteBadge(route: route)

            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text(route.name)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)

                // `ETAText` needs a real number, so it's only built when there is one.
                if let minutes {
                    HStack(spacing: Spacing.xs) {
                        Circle()
                            .fill(dotColor)
                            .frame(width: 6, height: 6)

                        ETAText(minutes: minutes)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                } else {
                    // No bus right now: same font and gray as the time, without the dot.
                    Text("— min")
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
        SavedRouteTile(route: .sampleUnknown1, minutes: nil)
    }
    .padding()
    .background(Color.groupedBackground)
}
