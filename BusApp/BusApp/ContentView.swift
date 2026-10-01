import SwiftUI

/// The root of the app.
///
/// 👉 Issue #8 turns this into the app shell: a tab bar with
///    Home / Map / Schedule. For now it just shows the component gallery.
struct ContentView: View {
    var body: some View {
        // TODO (Issue #8): Replace this with a TabView.
        // The Home tab should show ComponentGallery() for now.
        ComponentGallery()
    }
}

#Preview {
    ContentView()
}
