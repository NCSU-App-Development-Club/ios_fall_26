import SwiftUI

/// A section title with an optional button on the right:
///   Saved Routes                See All
/// Home uses this above "Saved Routes" and "Recents".
///
/// 👉 Issue #15 — see the issue on GitHub for the picture, specs, and hints.
struct SectionHeader: View {
    let title: String
    /// The button's words, e.g. "See All". Leave it out for no button.
    var actionTitle: String? = nil
    /// What happens when the button is tapped.
    var action: (() -> Void)? = nil
    
    

    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(title)
                .font(.title3)
                .bold()
            Spacer()
            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(.subheadline)
                    .tint(Color.ncsuRed)
            }
        }
    }
}

#Preview("With button") {
    SectionHeader(title: "Saved Routes", actionTitle: "See All") {
        print("See All tapped")
    }
    .padding()
}

#Preview("No button") {
    SectionHeader(title: "Recents")
        .padding()
}
