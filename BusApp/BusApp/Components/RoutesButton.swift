// xcode: set sdk=iOS

import SwiftUI

/// The big red "🚌 Routes" pill in Home's top-left corner.
///
/// 👉 Issue #28 — see the issue on GitHub for the picture, specs, and hints.
struct RoutesButton: View {
    /// What happens when it's tapped
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label("Routes", systemImage: "bus")
                .font(.headline)
        }
        .buttonStyle(.glassProminent)
        .tint(Color.ncsuRed)
        .controlSize(.large)
    }
}

#Preview {
    RoutesButton {}
        .padding()
        .background(Color.white)
}
