import SwiftUI

/// Turns a number of minutes into friendly text:
///   0   → "Now"
///   12  → "12 min"
///   65  → "1 hr 5 min"
/// Used everywhere the app says when a bus arrives.
///
/// 👉 Issue #6 — see the issue on GitHub for the wireframe, specs, and hints.
struct ETAText: View {
    let minutes: Int
    
    /// TODO (Issue #6): Return the right text for `minutes`.
    /// Right now it just returns the raw number — fix it!
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
    }
        
    var body: some View {
        // TODO (Issue #6): Show `label` with the right styling.
        PlaceholderBox("ETAText: \(label)")
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 16) {
        ETAText(minutes: 0)
        ETAText(minutes: 1)
        ETAText(minutes: 12)
        ETAText(minutes: 60)
        ETAText(minutes: 65)
        ETAText(minutes: 135)
    }
    .padding()
}
