import SwiftUI

struct CrowdMeter: View {
    let level: CrowdLevel
    var filledCount: Int { switch level { case .empty: 0; case .some: 1; case .full: 3 } }
    var body: some View {
        switch level {
        case .empty:
            HStack(spacing: Spacing.xs) {
                ForEach(0..<3, id: \.self) { i in
                    Image(systemName: i < filledCount ? "person.fill" : "person")
                        .foregroundStyle(.green)
                }
                Text(level.rawValue)
            }
        case .some:
            HStack(spacing: Spacing.xs) {
                ForEach(0..<3, id: \.self) { i in
                    Image(systemName: i < filledCount ? "person.fill" : "person")
                        .foregroundStyle(.yellow)
                }
                Text(level.rawValue)
            }
        case .full:
            HStack(spacing: Spacing.xs) {
                ForEach(0..<3, id: \.self) { i in
                    Image(systemName: i < filledCount ? "person.fill" : "person")
                        .foregroundStyle(.red)
                }
                Text(level.rawValue)
            }
        }
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
