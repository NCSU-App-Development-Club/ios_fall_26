import SwiftUI

/// A bus on the map: a circle in the route's color with a white bus icon and a white ring.
///
/// 👉 Issue #45 — see the issue on GitHub for the picture, specs, and hints.
struct BusMarker: View {
    let route: Route

    var body: some View {
        Image(systemName: "bus.fill")
            .font(.caption.bold())
            .foregroundStyle(route.textColor)
            .frame(width: 26, height:26)
            .background(route.color, in: Circle())
            .shadow(radius: 2)
            .overlay {Circle().stroke(.white, lineWidth: 2)}
            //.shadow(radius: 2)
    }
}

#Preview {
    HStack(spacing: Spacing.m) {
        BusMarker(route: .sample30)
        BusMarker(route: .sample40)
        BusMarker(route: .sample60)
    }
    .padding()
    .background(Color.groupedBackground)
}
