import SwiftUI

/// Small gray text that says how fresh the bus data is:
///   "Updated just now"  ·  "Updated 5 min ago"  ·  "Updated at 1:45 PM"
/// Home and Stop Detail show this once we load live data.
///
/// 👉 Issue #21 — see the issue on GitHub for the specs and hints.
struct LastUpdatedText: View {
    /// When the data was last loaded.
    let date: Date

    /// TODO (Issue #21): Return the right words for `date`.
    /// Right now it just prints the raw date — fix it!
    var label: String {
        "Updated \(date)"
    }

    var body: some View {
        // TODO (Issue #21): Show `label` with the right styling.
        PlaceholderBox(label)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: Spacing.m) {
        LastUpdatedText(date: .now)                                  // Updated just now
        LastUpdatedText(date: .now.addingTimeInterval(-30))          // Updated just now
        LastUpdatedText(date: .now.addingTimeInterval(-5 * 60))      // Updated 5 min ago
        LastUpdatedText(date: .now.addingTimeInterval(-59 * 60))     // Updated 59 min ago
        LastUpdatedText(date: .now.addingTimeInterval(-3 * 60 * 60)) // Updated at <a time>
    }
    .padding()
}
