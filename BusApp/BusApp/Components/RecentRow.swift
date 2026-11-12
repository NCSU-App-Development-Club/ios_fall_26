import SwiftUI

/// One line in Home's Recents list:
///   (🕒)  Hunt Library                     ›
///         Centennial Campus
///
/// 👉 Issue #32 — see the issue on GitHub for the picture, specs, and hints.
struct RecentRow: View {
    let place: RecentPlace

    var body: some View {
        // TODO (Issue #32): Replace this placeholder with the real row.
        
        HStack(spacing: Spacing.ms){
            
            Image(systemName: "clock")
                .font(.subheadline)
                .foregroundStyle(.gray)
                .frame(width: 32, height: 32)
                .background(Color.groupedBackground, in: Circle())
            
            VStack(alignment: .leading){
                Text(place.name)
                    .font(.body)
                Text(place.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.footnote)
                .foregroundStyle(.tertiary)
            
        }
        .padding(.vertical, Spacing.ms)
    }
}

#Preview {
    VStack(spacing: 0) {
        ForEach(RecentPlace.samples) { place in
            RecentRow(place: place)
        }
    }
    .padding()
}
