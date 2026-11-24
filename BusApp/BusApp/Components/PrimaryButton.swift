import SwiftUI

/// The big red pill at the bottom of a form: "Send Feedback", "Done".
/// Shows a spinner while `isLoading`, and fades when the screen disables it.
///
/// ```swift
/// PrimaryButton(title: "Send Feedback", isLoading: false) { send() }
/// ```
///
/// - SeeAlso: GitHub issue #107 for the picture and specs.
struct PrimaryButton: View {
    let title: String
    /// Replaces the title with a spinner and ignores taps.
    var isLoading: Bool = false
    let action: () -> Void
    
    @Environment(\.isEnabled) private var isEnabled

    var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.ncsuRed, in: Capsule())
            .opacity(isEnabled ? 1 : 0.4)
        }
        .buttonStyle(.plain)
        .disabled(isLoading)
    }
}

#Preview("States") {
    VStack(spacing: Spacing.m) {
        PrimaryButton(title: "Send Feedback") {}
        PrimaryButton(title: "Send Feedback", isLoading: true) {}
        PrimaryButton(title: "Send Feedback") {}
            .disabled(true)
    }
    .padding()
    .background(Color.groupedBackground)
}
