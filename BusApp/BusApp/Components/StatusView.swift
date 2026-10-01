import SwiftUI

/// A friendly full-area message for when there's nothing to show:
/// "No buses right now", "Couldn't load arrivals", etc.
/// Every screen that loads data will need one of these.
///
/// 👉 Issue #5 — see the issue on GitHub for the wireframe, specs, and hints.
struct StatusView: View {
    /// An SF Symbol name, e.g. "bus" or "wifi.slash"
    let systemImage: String
    let title: String
    let message: String

    var body: some View {
        // TODO (Issue #5): Replace this placeholder with the real status view.
        PlaceholderBox("StatusView: \(title)")
    }
}

#Preview("Empty") {
    StatusView(systemImage: "bus", title: "No buses right now", message: "Nothing is scheduled for this stop. Check back later.")
}

#Preview("Error") {
    StatusView(systemImage: "wifi.slash", title: "Couldn't load arrivals", message: "Check your connection and try again.")
}
