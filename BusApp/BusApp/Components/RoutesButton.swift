import SwiftUI

/// The big red "🚌 Routes" pill in Home's top-left corner.
///
/// A prominent Liquid Glass button tinted ``SwiftUI/Color/ncsuRed``.
///
/// ```swift
/// RoutesButton { showRoutes = true }
/// ```
///
/// - SeeAlso: GitHub issue #28 for the picture and specs.
struct RoutesButton: View {
    /// Called when the button is tapped.
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
