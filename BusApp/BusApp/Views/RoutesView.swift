import SwiftUI

/// The Routes screen: a campus map with every route drawn on it,
/// the Routes button in the corner, and a sheet listing every route as a tile.
///
/// Build this one last: you only arrange components here, you don't restyle them.
///
/// The screen is three layers, back to front:
/// 1. A full-screen ``RoutesMap`` with every route line.
/// 2. ``RoutesButton`` in the top-left corner. It calls ``onClose``.
/// 3. A sheet locked at 60% height, showing ``RoutesSheet``.
///
/// On its own (the gallery, the preview) the screen presents its sheet itself.
/// That sheet can't be dismissed, and the map stays usable behind it.
/// Home presents ``RoutesSheet`` on top of its own sheet, where it can be
/// swiped or tapped away, so it turns that off:
///
/// ```swift
/// RoutesView(presentsSheet: false, onClose: { showRoutes = false })
/// ```
///
/// - SeeAlso: GitHub issue #49 for the picture and specs. Issue #42 lists
///   every component this screen uses.
struct RoutesView: View {
    /// Whether this screen presents ``RoutesSheet`` itself. Home passes `false`
    /// because it stacks the sheet on top of its own.
    var presentsSheet = true
    /// Called when the Routes button is tapped. Home passes in
    /// "close the Routes screen" (#50). Does nothing by default.
    var onClose: () -> Void = {}

    /// Keeps the bottom sheet on screen. It's never set to `false`.
    @State private var showSheet = true

    var body: some View {
        ZStack(alignment: .topLeading){
            // Only the map goes under the status bar; the button stays in the safe area.
            RoutesMap(lines: RouteLine.samples).ignoresSafeArea()

            RoutesButton(action: onClose)
                .padding(.leading, Spacing.m)
            }
        // `.constant(false)` means "never present": the parent shows the sheet instead.
        .sheet(isPresented: presentsSheet ? $showSheet : .constant(false)){
            RoutesSheet()
                // On its own there is nothing to go back to, so the sheet stays up...
                .interactiveDismissDisabled()
                // ...and the map can be panned and zoomed behind it.
                .presentationBackgroundInteraction(.enabled)
        }
    }
}

/// What the Routes screen's bottom sheet shows: a ``SheetHeader`` and the
/// ``RouteGrid``, at a fixed 60% height.
///
/// It is its own view so that both ``RoutesView`` and ``HomeView`` can present it.
/// Whether it can be dismissed is up to whoever presents it.
struct RoutesSheet: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: Spacing.ms){
                SheetHeader(title: "All Routes", detail: "\(Route.all.count) routes · Fall 2026")
                RouteGrid(statuses: RouteStatus.samples, onSelect: { _ in })
            }
            .padding(Spacing.m)
        }
            // One detent, so the sheet stays at 60% and keeps its glass look.
            .presentationDetents([.fraction(0.6)])
            // No bounce when the grid already fits.
            .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    RoutesView()
}
