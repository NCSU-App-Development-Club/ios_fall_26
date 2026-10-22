import SwiftUI

/// One line in Home's Recents list:
///   (🕒)  Hunt Library                     ›
///         Centennial Campus
///
/// 👉 Issue #32 — see the issue on GitHub for the picture, specs, and hints.
struct RecentRow: View {
    let place: RecentPlace

    var body: some View {
        // TODO (Issue #32): Replace this placeholder with the real row.
        PlaceholderBox("RecentRow: \(place.name)")
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
