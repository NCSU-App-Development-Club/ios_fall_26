import SwiftUI

/// A small tile for one saved route: its badge, its name, and when the next bus comes.
///   [30]
///   Wolf Village
///   • 4 min
///
/// 👉 Issue #31 — see the issue on GitHub for the picture, specs, and hints.
struct SavedRouteTile: View {
    let route: Route
    /// Minutes until the next bus on this route
    let minutes: Int
    
    private var dotColor: Color {
        minutes > 30 ? Color.secondary : Color.liveGreen
    }

    var body: some View {
        // TODO (Issue #31): Replace this placeholder with the real tile.
        // Reuse RouteBadge (#2) and ETAText (#6). Don't rebuild them!
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
