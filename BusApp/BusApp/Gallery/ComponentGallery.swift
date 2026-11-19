import SwiftUI

/// Shows every reusable component in one scrolling list.
///
/// Members: you don't need to edit this file. When your issue's PR gets merged,
/// your component will automatically replace its placeholder here.
struct ComponentGallery: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                Section("#2 · RouteBadge") {
                    HStack(spacing: Spacing.s) {
                        ForEach(Route.samples) { route in
                            RouteBadge(route: route)
                        }
                    }
                }

                Section("#3 · StopLabel") {
                    ForEach(Stop.samples) { stop in
                        StopLabel(stop: stop)
                    }
                }

                Section("#5 · StatusView") {
                    StatusView(
                        systemImage: "bus",
                        title: "No buses right now",
                        message: "Nothing is scheduled for this stop. Check back later."
                    )
                }

                Section("#6 · ETAText") {
                    ForEach([0, 12, 65], id: \.self) { minutes in
                        ETAText(minutes: minutes)
                    }
                }

                Section("#7 · SearchBar") {
                    SearchBar(text: $searchText)
                }

                Section("#15 · SectionHeader") {
                    SectionHeader(title: "Saved Routes", actionTitle: "See All") {}
                    SectionHeader(title: "Recents")
                }

                Section("#27 · GlassIconButton") {
                    HStack(spacing: Spacing.m) {
                        GlassIconButton(systemImage: "bell", showsBadge: true) {}
                        GlassIconButton(systemImage: "person") {}
                        GlassIconButton(systemImage: "info.circle") {}
                        GlassIconButton(systemImage: "location.fill", tint: .ncsuRed) {}
                    }
                }

                Section("#28 · RoutesButton") {
                    RoutesButton {}
                }

                Section("#29 · TripStepChip") {
                    HStack(spacing: Spacing.s) {
                        ForEach(TripStep.samples) { step in
                            TripStepChip(step: step)
                        }
                    }
                }

                Section("#30 · TimeToLeaveCard") {
                    TimeToLeaveCard(trip: .sample) {}
                }

                Section("#31 · SavedRouteTile") {
                    HStack(spacing: Spacing.s) {
                        SavedRouteTile(route: .sample30, minutes: 4)
                        SavedRouteTile(route: .sample40, minutes: 9)
                        SavedRouteTile(route: .sample20, minutes: 12)
                    }
                }

                Section("#32 · RecentRow") {
                    ForEach(RecentPlace.samples) { place in
                        RecentRow(place: place)
                    }
                }

                Section("#43 · SheetHeader") {
                    SheetHeader(title: "All Routes", detail: "11 routes · Fall 2026")
                    SheetHeader(title: "Notifications")
                }

                Section("#44 · StopDot") {
                    HStack(spacing: Spacing.m) {
                        StopDot(color: .routeIndigo)
                        StopDot(color: .routeAqua)
                    }
                }

                Section("#45 · BusMarker") {
                    HStack(spacing: Spacing.m) {
                        BusMarker(route: .sample30)
                        BusMarker(route: .sample40)
                    }
                }

                Section("#47 · RouteGrid") {
                    RouteGrid(statuses: RouteStatus.samples) { _ in }
                }

                Section("#48 · RoutesMap") {
                    RoutesMap(lines: RouteLine.samples)
                        .frame(height: 300)
                }

                Section("#61 · NotificationIcon") {
                    HStack(spacing: Spacing.m) {
                        NotificationIcon(kind: .dwelling(.sample40))
                        NotificationIcon(kind: .moving(.sample40))
                        NotificationIcon(kind: .timeToLeave)
                    }
                }

                Section("#62 · TimeAgoText") {
                    ForEach([0, 3, 95, 1500], id: \.self) { minutes in
                        TimeAgoText(minutes: minutes)
                    }
                }

                Section("#63 · NotificationRow") {
                    NotificationRow(notification: AppNotification.today[0])
                    NotificationRow(notification: .sampleLong)
                }

                Section("#64 · NotificationList") {
                    NotificationList(notifications: AppNotification.samples)
                    NotificationList(notifications: [])
                }

                Section("Screens · tap to open") {
                    NavigationLink("#26 · Home") { HomeView() }
                    NavigationLink("#42 · Routes") { RoutesView() }
                    NavigationLink("#60 · Notifications") { NotificationsView() }
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ComponentGallery()
}
