import SwiftUI

/// Small gray text that says how fresh the bus data is:
///   "Updated just now"  ·  "Updated 5 min ago"  ·  "Updated at 1:45 PM"
/// Home and Stop Detail show this once we load live data.
///
/// 👉 Issue #21 — see the issue on GitHub for the specs and hints.
struct LastUpdatedText: View {
    /// When the data was last loaded.
    let date: Date
    
    var body: some View {
        TimelineView(.everyMinute) { context in
            Text(label(at: context.date))
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
    
    private func label(at now: Date) -> String {
        let seconds = Date.now.timeIntervalSince(date)
        let minutes = Int(seconds / 60)
        
        if minutes < 1 {
            return "Updated just now"
        } else if minutes < 60 {
            return "Updated \(minutes) min ago"
        } else {
            return "Updated at \(date.formatted(date: .omitted, time: .shortened))"
        }
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
