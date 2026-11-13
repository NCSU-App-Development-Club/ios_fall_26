import SwiftUI

/// One line in Home's Recents list.
///
/// ```
/// (🕒)  Hunt Library                     ›
///       Centennial Campus
/// ```
///
/// Rows have no background or divider of their own; the Recents card in
/// `HomeView` supplies both.
///
/// - SeeAlso: GitHub issue #32 for the picture and specs.
struct RecentRow: View {
    /// The place to show: its name on top, its subtitle underneath.
    let place: RecentPlace

    var body: some View {
        HStack(spacing: Spacing.ms) {
            Image(systemName: "clock")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(width: 32, height: 32)
                .background(Color.groupedBackground, in: Circle())

            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.body)
                Text(place.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.footnote)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, Spacing.ms)
    }
}

#Preview {
    VStack(spacing: 0) {
        ForEach(RecentPlace.samples) { place in
            RecentRow(place: place)
        }
    }
    .padding()
}
