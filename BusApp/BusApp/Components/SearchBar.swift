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
        HStack(){
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            
            TextField(
                placeholder,
                text : $text)
            if (text != "") {
                Button {
                    text = ""
                }
                label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)

                }
            }
            
        }
        .padding()
        .overlay(Capsule().stroke(.gray, lineWidth: 1))
    }
}

#Preview {
    @Previewable @State var text = ""
    VStack(spacing: Spacing.m) {
        SearchBar(text: $text)
        Text("You typed: \(text)")
            .foregroundStyle(.secondary)
    }
    .padding()
}
