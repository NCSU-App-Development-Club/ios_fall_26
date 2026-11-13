import SwiftUI
import MapKit

/// The Home screen: a map of campus, glass buttons floating on top,
/// and a sheet at the bottom with Time to Leave, Saved Routes, and Recents.
///
/// The screen is three layers in a `ZStack`, back to front:
/// 1. A full-screen campus `Map`.
/// 2. Floating controls: ``RoutesButton`` and two ``GlassIconButton``s on top,
///    and the info / ``SearchBar`` / location row just above the sheet.
/// 3. A bottom sheet that can't be dismissed. It opens at half height, can be
///    dragged to full height, and leaves the map usable behind it.
///
/// This view only arranges components; each one is styled in its own file.
/// Buttons have empty actions for now.
///
/// - SeeAlso: GitHub issue #34 for the specs, and issue #26 for the list of
///   components this screen uses.
struct HomeView: View {
    /// Keeps the bottom sheet on screen. It's never set to `false`.
    @State private var showsSheet = true
    /// The text typed into the search bar.
    @State private var searchText = ""
    /// How tall the sheet is right now, so the search row can sit just above it.
    @State private var sheetHeight: CGFloat = 0

    /// The middle of NC State's main campus.
    private static let campus = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.7847, longitude: -78.6821),
        span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
    ) // replace with current location?

    var body: some View {
        ZStack {
            Map(initialPosition: .region(Self.campus))
                .ignoresSafeArea()

            VStack {
                topButtons
                Spacer()
                searchRow
                    .padding(.bottom, sheetHeight)
            }
            .padding(.horizontal, Spacing.m)
        }
        .sheet(isPresented: $showsSheet) {
            sheetContent
                .onGeometryChange(for: CGFloat.self) { proxy in
                    proxy.size.height
                } action: { height in
                    sheetHeight = height
                }
                .presentationDetents([.medium, .large])
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
    }

    /// Routes on the left; notifications and profile on the right.
    private var topButtons: some View {
        HStack {
            RoutesButton {}
            Spacer()
            GlassIconButton(systemImage: "bell", showsBadge: true) {}
            GlassIconButton(systemImage: "person") {}
        }
    }

    /// Feedback, search, and re-pin location, in one row above the sheet.
    private var searchRow: some View {
        HStack(spacing: Spacing.s) {
            GlassIconButton(systemImage: "info.circle") {}
            SearchBar(text: $searchText)
            GlassIconButton(systemImage: "location.fill", tint: .ncsuRed) {}
        }
        .padding(.bottom, Spacing.s)
    }

    /// Everything inside the bottom sheet, scrolling top to bottom.
    private var sheetContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.m) {
                TimeToLeaveCard(trip: .sample) {}

                SectionHeader(title: "Saved Routes", actionTitle: "See All") {}
                HStack(spacing: Spacing.s) {
                    SavedRouteTile(route: .sample30, minutes: 4)
                    SavedRouteTile(route: .sample40, minutes: 9)
                    SavedRouteTile(route: .sample20, minutes: 12)
                }

                SectionHeader(title: "Recents")
                recentsCard
            }
            .padding(.horizontal, Spacing.m)
            .padding(.top, Spacing.l)
            .padding(.bottom, Spacing.s)
        }
    }

    /// One white card holding every recent place, with a line between rows.
    private var recentsCard: some View {
        VStack(spacing: 0) {
            ForEach(RecentPlace.samples) { place in
                RecentRow(place: place)
                // No line under the last row.
                if place.id != RecentPlace.samples.last?.id {
                    Divider()
                }
            }
        }
        .padding(.horizontal, Spacing.m)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.card))
    }
}

#Preview {
    HomeView()
}
