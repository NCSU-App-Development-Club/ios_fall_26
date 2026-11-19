import SwiftUI

/// Turns a number of minutes into friendly text.
///
/// | `minutes` | Shows        |
/// |-----------|--------------|
/// | `0`       | "Now"        |
/// | `12`      | "12 min"     |
/// | `60`      | "1 hr"       |
/// | `65`      | "1 hr 5 min" |
///
/// Used everywhere the app says when a bus arrives. Other components that need
/// the text without the view (e.g. ``TripStepChip``) can read ``label`` directly.
///
/// - SeeAlso: GitHub issue #6 for the wireframe and specs.
struct ETAText: View {
    /// Minutes until the bus arrives. `0` means it's here now.
    let minutes: Int

    /// The formatted text for ``minutes``, e.g. `"1 hr 5 min"`.
    var label: String {
        switch minutes {
        case 0:
            return "Now"

        case 1..<60:
            return "\(minutes) min"
        default:
            let hours = minutes / 60
            let mins = minutes % 60

            if mins == 0 {
                return "\(hours) hr"
            }
            return "\(hours) hr \(mins) min"
        }
    } // <-- This closing brace was missing!

    /// Plain text, so the screen using it picks the font and color,
    /// e.g. `ETAText(minutes: 4).font(.footnote)`.
    var body: some View {
        Text(label)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: Spacing.s) {
        ETAText(minutes: 0)
        ETAText(minutes: 12)
        ETAText(minutes: 60)
        ETAText(minutes: 65)
    }
    .padding()
}
