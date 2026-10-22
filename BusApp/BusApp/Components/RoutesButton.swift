import SwiftUI

/// The big red "🚌 Routes" pill in Home's top-left corner.
///
/// 👉 Issue #28 — see the issue on GitHub for the picture, specs, and hints.
struct RoutesButton: View {
    /// What happens when it's tapped
    let action: () -> Void

    var body: some View {
        // TODO (Issue #28): Replace this placeholder with the real button.
        PlaceholderBox("RoutesButton")
    }
}

#Preview {
    RoutesButton {}
        .padding()
        .background(Color.groupedBackground)
}
