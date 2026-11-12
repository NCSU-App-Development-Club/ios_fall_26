import SwiftUI

/// Every notification, grouped by day under small gray labels:
///   Today
///   [row] [row] [row]
///   Yesterday
///   [row] [row]
/// With no notifications, a friendly "nothing yet" message instead.
///
/// 👉 Issue #64 — see the issue on GitHub for the picture, specs, and hints.
struct NotificationList: View {
    /// Newest first
    let notifications: [AppNotification]

    var body: some View {
        // TODO (Issue #64): Replace this placeholder with the real list.
        PlaceholderBox("NotificationList: \(notifications.count) notifications")
    }
}

#Preview("Today and yesterday") {
    ScrollView {
        NotificationList(notifications: AppNotification.samples)
            .padding()
    }
    .background(Color.groupedBackground)
}

#Preview("Today only") {
    NotificationList(notifications: AppNotification.today)
        .padding()
        .background(Color.groupedBackground)
}

#Preview("Empty") {
    NotificationList(notifications: [])
        .padding()
        .background(Color.groupedBackground)
}
