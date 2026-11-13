import SwiftUI

/// The Routes screen: a campus map with every route drawn on it,
/// the Routes button in the corner, and a sheet listing every route as a tile.
///
/// Build this one last: you only arrange components here, you don't restyle them.
///
/// - SeeAlso: GitHub issue #49 for the picture and specs. Issue #42 lists
///   every component this screen uses.
struct RoutesView: View {
    /// What the Routes button does. Home passes in "close the Routes screen" (#50).
    var onClose: () -> Void = {}

    var body: some View {
        // TODO (Issue #49): Replace this placeholder with the real screen.
        PlaceholderBox("RoutesView")
    }
}

#Preview {
    RoutesView()
}
