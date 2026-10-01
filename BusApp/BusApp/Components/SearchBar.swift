import SwiftUI

/// A search field for finding stops and places: 🔍 [ Search…      ⓧ ]
/// It doesn't own the text — the screen that uses it does, and passes it in
/// as a Binding (that's what the `$` is for).
///
/// 👉 Issue #7 — see the issue on GitHub for the wireframe, specs, and hints.
struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search for a stop or place"

    var body: some View {
        // TODO (Issue #7): Replace this placeholder with the real search bar.
        PlaceholderBox("SearchBar: \"\(text)\"")
    }
}

#Preview( body: <#@MainActor () -> any View#>)
if #available(iOS 17.0, *) {
    do {
        @Previewable @State var text = ""
        VStack(spacing: Spacing.m) {
            SearchBar(text: $text)
            Text("You typed: \(text)")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
} else {
    // Fallback on earlier versions
}
