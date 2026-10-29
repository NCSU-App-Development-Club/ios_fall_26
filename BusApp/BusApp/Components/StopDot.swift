import SwiftUI

/// The small white dot with a colored ring that marks a bus stop on the map.
///
/// 👉 Issue #44 — see the issue on GitHub for the picture, specs, and hints.
struct StopDot: View {
    var isSelected = false
    let color: Color

    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: isSelected ? 14 : 8, height: isSelected ? 14 : 8)
            .overlay {Circle().stroke(color, lineWidth: 2) }
            
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        StopDot(color: .routeIndigo)
        StopDot(color: .routeAqua)
        StopDot(color: .routeOrange)
        StopDot(isSelected: true, color: .routeGreen)
        
    }
    .padding()
    .background(Color.groupedBackground)
}
