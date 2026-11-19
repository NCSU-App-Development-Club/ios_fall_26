import SwiftUI

/// The big white box you type your feedback into. Shows a gray hint while it's empty.
///
/// ```swift
/// MessageField(text: $message, placeholder: "Describe what happened…")
/// ```
///
/// - SeeAlso: GitHub issue #105 for the picture and specs.
struct MessageField: View {
    @Binding var text: String
    /// The gray hint shown while `text` is empty.
    let placeholder: String

    var body: some View {
        // TODO (Issue #105): Replace this placeholder with the real message box.
        PlaceholderBox("MessageField")
    }
}

#Preview("Empty") {
    @Previewable @State var text = ""
    MessageField(text: $text, placeholder: "Describe what happened…")
        .padding()
        .background(Color.groupedBackground)
}

#Preview("With text") {
    @Previewable @State var text = "The map freezes when I open Routes and then tap the bell right away, and it stays frozen until I restart the app."
    MessageField(text: $text, placeholder: "Describe what happened…")
        .padding()
        .background(Color.groupedBackground)
}
