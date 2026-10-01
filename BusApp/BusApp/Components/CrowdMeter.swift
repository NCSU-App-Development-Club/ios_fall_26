import SwiftUI

/// Shows how full a bus is: empty, some seats, or full.
/// Riders will report this (crowdsourcing), so it shows up wherever a bus does.
///
/// 👉 Issue #4 — see the issue on GitHub for the wireframe, specs, and hints.
struct CrowdMeter: View {
    let level: CrowdLevel

    var body: some View {
        // TODO (Issue #4): Replace this placeholder with the real meter.
        // Hint: a `switch` on `level` is a great way to decide what to show.
        PlaceholderBox("CrowdMeter: \(level.rawValue)")
    }
}

#Preview {
    VStack(alignment: .leading, spacing: Spacing.m) {
        ForEach(CrowdLevel.allCases) { level in
            CrowdMeter(level: level)
        }
    }
    .padding()
}
