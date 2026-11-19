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
/// The Routes button fades the map and buttons over to ``RoutesView`` and
/// raises ``RoutesSheet`` on top of Home's own sheet. Swiping that sheet down,
/// tapping outside it, or tapping Routes again closes it. The other buttons
/// have empty actions for now.
///
/// - SeeAlso: GitHub issue #34 for the specs, issue #26 for the list of
///   components this screen uses, and issue #50 for the Routes hookup.
struct HomeView: View {
    /// Keeps the bottom sheet on screen. It's never set to `false`.
    @State private var showsSheet = true
    /// The text typed into the search bar.
    @State private var searchText = ""
    /// How tall Home's sheet is right now, so the search row can sit just above it.
    @State private var sheetHeight: CGFloat = 0
    /// Whether Routes is open: its map and buttons replace Home's, and its
    /// sheet sits on top of Home's sheet.
    @State private var showRoutes = false

    var body: some View {
        ZStack {
            // Two whole screens; `.animation` plus `.transition` fades between them.
            if showRoutes {
                // The Routes sheet comes from Home's sheet below, not from RoutesView.
                RoutesView(presentsSheet: false, onClose: {
                    showRoutes = false
                })
                .transition(.opacity)
            }
            else {
                ZStack {
                    // Same region as the Routes map, so the map doesn't jump on the swap.
                    Map(initialPosition: .region(.campus))
                        .ignoresSafeArea()
                    
                    VStack {
                        topButtons
                        Spacer()
                        searchRow
                            .padding(.bottom, sheetHeight)
                    }
                    .padding(.horizontal, Spacing.m)
                }
                .transition(.opacity)
            }
        }
        // Fades on every change of `showRoutes`, including when the system sets
        // it to `false` because the Routes sheet was swiped or tapped away.
        .animation(.default, value: showRoutes)
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
                // A sheet presented from inside a sheet stacks on top of it,
                // so Home's sheet stays where it is underneath. It can be
                // dismissed the usual ways: swipe down, or tap outside it.
                .sheet(isPresented: $showRoutes) {
                    RoutesSheet()
                }
        }
    }
    
    /// Routes on the left; notifications and profile on the right.
    private var topButtons: some View {
        HStack {
            RoutesButton {
                showRoutes = true
            }
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
