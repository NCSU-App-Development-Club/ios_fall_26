import SwiftUI

/// The colored circle on the left of a notification, with a white symbol inside:
///   ⏸ in the route's color  (a bus is holding at a stop)
///   🚌 in the route's color  (a bus is moving again)
///   🕒 in Wolfpack red       (time to leave)
///
/// 👉 Issue #61 — see the issue on GitHub for the picture, specs, and hints.
struct NotificationIcon: View {
    let kind: AppNotification.Kind

    var body: some View {
        // TODO (Issue #61): Replace this placeholder with the real icon.
        PlaceholderBox("icon")
            .frame(width: 40)
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        NotificationIcon(kind: .dwelling(.sample40))
        NotificationIcon(kind: .moving(.sample40))
        NotificationIcon(kind: .timeToLeave)
        NotificationIcon(kind: .moving(.sample60))
    }
    .padding()
}
