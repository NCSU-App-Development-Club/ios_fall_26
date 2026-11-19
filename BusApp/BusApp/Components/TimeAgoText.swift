import SwiftUI

/// How long ago something happened, in a few letters:
///   0     → "now"
///   3     → "3m"
///   95    → "1h"
///   1500  → "1d"
/// The little gray time on the right of each notification.
///
/// 👉 Issue #62 — see the issue on GitHub for the picture, specs, and hints.
struct TimeAgoText: View {
    /// Minutes since it happened
    let minutes: Int

    /// TODO (Issue #62): Return the right text for `minutes`.
    /// Right now it just returns the raw number — fix it!
    var label: String {
        "\(minutes)"
    }

    /// Plain text, so the screen using it picks the font and color,
    /// e.g. `TimeAgoText(minutes: 3).font(.footnote)`.
    var body: some View {
        Text(label)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: Spacing.s) {
        TimeAgoText(minutes: 0)
        TimeAgoText(minutes: 3)
        TimeAgoText(minutes: 59)
        TimeAgoText(minutes: 60)
        TimeAgoText(minutes: 95)
        TimeAgoText(minutes: 1500)
    }
    .padding()
}
