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

                Section("#4 · CrowdMeter") {
                    ForEach(CrowdLevel.allCases) { level in
                        CrowdMeter(level: level)
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

                Section("Screens · tap to open") {
                    NavigationLink("#26 · Home") { HomeView() }
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ComponentGallery()
}
