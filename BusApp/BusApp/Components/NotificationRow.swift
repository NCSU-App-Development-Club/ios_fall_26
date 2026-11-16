import SwiftUI

/// One notification as a white card:
///   (⏸)  Route 40 is dwelling                     now
///        Holding at Dunn Ave at Jeter Dr. Departure
///        expected in about 2 min.
///
/// 👉 Issue #63 — see the issue on GitHub for the picture, specs, and hints.
struct NotificationRow: View {
    let notification: AppNotification

    var body: some View {
        // TODO (Issue #63): Replace this placeholder with the real row.
        PlaceholderBox("NotificationRow: \(notification.title)")
    }
}

#Preview("Today") {
    VStack(spacing: Spacing.s) {
        ForEach(AppNotification.today) { notification in
            NotificationRow(notification: notification)
        }
    }
    .padding()
    .background(Color.groupedBackground)
}

#Preview("Long text") {
    NotificationRow(notification: .sampleLong)
        .padding()
        .background(Color.groupedBackground)
}
