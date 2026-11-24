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
    
    private let maxMessageLength = 500
    private let messageFieldHeight: CGFloat = 150

    var body: some View {
        TextEditor(text: $text)
            .scrollContentBackground(.hidden)
            .overlay(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 8)
                        .foregroundStyle(.secondary)
                        .allowsHitTesting(false)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                Text("\(text.count)/\(maxMessageLength)")
                    .foregroundStyle(.secondary)
                    .allowsHitTesting(false)
                    .font(.footnote)
            }
            .padding(.horizontal, Spacing.ms)
            .padding(.vertical, Spacing.s)
            .frame(height: messageFieldHeight)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.tile))
            .onChange(of: text) {
                if text.count > maxMessageLength {
                    text = String(text.prefix(maxMessageLength))
                }
            }
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
