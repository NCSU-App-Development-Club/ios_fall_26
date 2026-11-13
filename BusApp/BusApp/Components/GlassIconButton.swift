import SwiftUI

/// A round frosted-glass button with an icon: 🔔 👤 ⓘ ➤
///
/// Home floats four of these over the map. The bell shows a small red dot
/// when there's something new.
///
/// ```swift
/// GlassIconButton(systemImage: "bell", showsBadge: true) { }
/// ```
///
/// - SeeAlso: GitHub issue #27 for the picture and specs.
struct GlassIconButton: View {
    /// An SF Symbol name, e.g. `"bell"` or `"person"`.
    let systemImage: String
    /// Shows a small red dot on the button's top-right corner.
    var showsBadge: Bool = false
    /// The icon's color.
    var tint: Color = .primary
    /// Called when the button is tapped.
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.title2)
                .foregroundStyle(tint)
                .frame(width: 50, height: 50)
        }
        .buttonStyle(.plain)
        .glassEffect(.regular, in: Circle())
        .overlay(alignment: .topTrailing) {
            if showsBadge {
                Circle()
                    .fill(Color.ncsuRed)
                    .frame(width: 10, height: 10)
                    .offset(x: -Spacing.xs, y: Spacing.xs)
            }
        }
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
