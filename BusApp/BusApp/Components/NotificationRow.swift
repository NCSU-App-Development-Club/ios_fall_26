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
        HStack(alignment: .top, spacing: Spacing.ms) {
            NotificationIcon(kind: notification.kind)

            VStack(alignment: .leading, spacing: Spacing.xs) {
                HStack(alignment: .firstTextBaseline) {
                    Text(notification.title)
                        .font(.callout.weight(.semibold))
                    Spacer()
                    TimeAgoText(minutes: notification.minutesAgo)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Text(notification.message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(Spacing.ms)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.row))
        .accessibilityElement(children: .combine)
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
