import SwiftUI

/// The Search screen: type a name, see matching stops and routes, tap one to open it.
///
/// 👉 Issue #18 — see the issue on GitHub for the specs and hints.
struct SearchView: View {
    /// What the user has typed. The SearchBar changes it; the lists read it.
    @State private var query = ""

    var body: some View {
        // TODO (Issue #18): Replace this placeholder with the real screen.
        PlaceholderBox("SearchView")
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
