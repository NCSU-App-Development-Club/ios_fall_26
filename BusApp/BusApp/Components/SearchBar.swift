import SwiftUI

/// A search field for finding stops and places: 🔍 [ Search…      ⓧ ]
///
/// It doesn't own the text. The screen that uses it does, and passes it in
/// as a `Binding` (that's what the `$` is for). The ⓧ button appears once
/// there's text and clears it.
///
/// ```swift
/// @State private var query = ""
/// SearchBar(text: $query)
/// ```
///
/// - SeeAlso: GitHub issue #7 for the wireframe and specs.
struct SearchBar: View {
    /// The text in the field, owned by the parent view.
    @Binding var text: String
    /// Gray hint shown while the field is empty.
    var placeholder: String = "Search for a stop or place"

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField(placeholder, text: $text)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .glassEffect(.regular.interactive(), in: Capsule())
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
