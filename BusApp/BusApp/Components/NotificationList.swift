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
    
    @ViewBuilder
    private func group(_ title: String, _ items: [AppNotification]) -> some View {
        if !items.isEmpty {
            Text(title)
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, Spacing.xs)
                .padding(.top, Spacing.s)
            ForEach(items) { notification in
                NotificationRow(notification: notification)
            }
        }
    }
    
    var body: some View {
        if notifications.isEmpty {
            StatusView(
                systemImage: "bell.slash",
                title: "No notifications yet",
                message: "We'll let you know when your bus is close or it's time to leave."
            )
        } else {
            VStack(alignment: .leading, spacing: Spacing.s) {
                group("Today", notifications.filter { Calendar.current.isDateInToday($0.date) })
                group("Yesterday", notifications.filter { Calendar.current.isDateInYesterday($0.date) })
                group("Earlier", notifications.filter {
                    !Calendar.current.isDateInToday($0.date) && !Calendar.current.isDateInYesterday($0.date)
                })
            }
        }
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
