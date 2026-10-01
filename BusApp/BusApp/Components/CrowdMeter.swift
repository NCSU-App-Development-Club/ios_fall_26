import SwiftUI

/// Shows how full a bus is: empty, some seats, or full.
/// Riders will report this (crowdsourcing), so it shows up wherever a bus does.
///
/// 👉 Issue #4 — see the issue on GitHub for the wireframe, specs, and hints.
struct CrowdMeter: View {
    let level: CrowdLevel
    var filledCount: Int { switch level { case .empty: 0; case .some: 1; case .full: 2 } }
    var body: some View {
        // TODO (Issue #4): Replace this placeholder with the real meter.
        switch level {
        case .empty:
            HStack(spacing: 10) {
                Image(systemName: "person")
                    .foregroundStyle(.green)
                Image(systemName: "person")
                    .foregroundStyle(.green)
                Image(systemName: "person")
                    .foregroundStyle(.green)
                Text(level.rawValue)
            }
            
        case .some:
            HStack(spacing: 10) {
                Image(systemName: "person.fill")
                    .foregroundStyle(.yellow)
                Image(systemName: "person")
                    .foregroundStyle(.yellow)
                Image(systemName: "person")
                    .foregroundStyle(.yellow)
                Text(level.rawValue)
            }
        case .full:
            HStack(spacing: 10) {
                Image(systemName: "person.fill")
                    .foregroundStyle(.red)
                Image(systemName: "person.fill")
                    .foregroundStyle(.red)
                Image(systemName: "person.fill")
                    .foregroundStyle(.red)
                Text(level.rawValue)
            }
        }
        // Hint: a `switch` on `level` is a great way to decide what to show.
        // PlaceholderBox("CrowdMeter: \(level.rawValue)")
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
