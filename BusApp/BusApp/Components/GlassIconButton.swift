import SwiftUI

/// A round frosted-glass button with an icon: 🔔 👤 ⓘ ➤
/// Home floats four of these over the map. The bell has a red dot when there's something new.
///
/// 👉 Issue #27 — see the issue on GitHub for the picture, specs, and hints.
struct GlassIconButton: View {
    /// An SF Symbol name, e.g. "bell" or "person"
    let systemImage: String
    /// Show a small red dot on the icon's corner
    var showsBadge: Bool = false
    /// The icon's color
    var tint: Color = .primary
    /// What happens when it's tapped
    let action: () -> Void

    var body: some View {
        // TODO (Issue #27): Replace this placeholder with the real button.
        PlaceholderBox(systemImage)
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        GlassIconButton(systemImage: "bell", showsBadge: true) {}
        GlassIconButton(systemImage: "person") {}
        GlassIconButton(systemImage: "info.circle") {}
        GlassIconButton(systemImage: "location.fill", tint: .ncsuRed) {}
    }
    .padding()
    .background(Color.groupedBackground)
}
