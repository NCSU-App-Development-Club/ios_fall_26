import SwiftUI

/// The big title at the top of a sheet, with an optional gray note on the right:
///   All Routes                11 routes · Fall 2026
/// Routes uses it now. Notifications and Feedback will use it later.
///
/// 👉 Issue #43 — see the issue on GitHub for the picture, specs, and hints.
struct SheetHeader: View {
    let title: String
    /// The gray text on the right. Leave it out for none.
    var detail: String? = nil

    var body: some View {
        // TODO (Issue #43): Replace this placeholder with the real header.
        PlaceholderBox("SheetHeader: \(title)")
    }
}

#Preview("With detail") {
    SheetHeader(title: "All Routes", detail: "11 routes · Fall 2026")
        .padding()
}

#Preview("Title only") {
    SheetHeader(title: "Notifications")
        .padding()
}
