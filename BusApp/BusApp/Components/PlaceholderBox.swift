import SwiftUI

/// A gray dashed box that stands in for a component that hasn't been built yet.
/// When you finish your issue, your component's `body` should no longer use this.
struct PlaceholderBox: View {
    let label: String

    init(_ label: String) {
        self.label = label
    }

    var body: some View {
        Text(label)
            .font(.caption.monospaced())
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(.quaternary.opacity(0.5), in: RoundedRectangle(cornerRadius: Radius.small))
            .overlay {
                RoundedRectangle(cornerRadius: Radius.small)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4]))
                    .foregroundStyle(.secondary)
            }
    }
}

#Preview {
    PlaceholderBox("RouteBadge")
        .padding()
}
