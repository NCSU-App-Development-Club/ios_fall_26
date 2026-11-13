import SwiftUI

/// The root of the app.
///
/// Shows ``ComponentGallery`` so every component and screen can be opened
/// from one list while the app is being built.
struct ContentView: View {
    var body: some View {
        ComponentGallery()
    }
}

#Preview {
    ContentView()
}
