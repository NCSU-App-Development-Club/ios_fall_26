import SwiftUI

/// The Notifications screen: a "Notifications" title with an X button,
/// and every notification grouped by day. It slides up over Home when you tap the bell.
///
/// 👉 Issue #65 — see the issue on GitHub for the picture, specs, and hints.
///    Every component this screen uses has its own issue (#60 lists them).
///    Build this one last: you only arrange components here, you don't restyle them.
struct NotificationsView: View {
    /// What the X button does. Home passes in "close Notifications" (#66).
    var onClose: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.s) {
            HStack() {
                SheetHeader(title: "Notifications")
                GlassIconButton(systemImage: "xmark", action: onClose)
            }
            .padding(.horizontal, Spacing.m)
            .padding(.top, Spacing.l)
        }
        ScrollView {
            NotificationList(notifications: AppNotification.samples)
                .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NotificationsView()
}

#Preview("As a sheet") {
    Color.gray
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            NotificationsView()
                .presentationBackground(Color.groupedBackground)
        }
}
