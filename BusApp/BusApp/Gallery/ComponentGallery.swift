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
                    SectionHeader(title: "Nearby stops", actionTitle: "See all") {}
                    SectionHeader(title: "Favorites")
                }

                Section("Screens · tap to open") {
                    NavigationLink("#16 · Stop Detail") { StopDetailView(stop: .sampleNear) }
                    NavigationLink("#17 · Route Detail") { RouteDetailView(route: .sample40) }
                    NavigationLink("#18 · Search") { SearchView() }
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ComponentGallery()
}
