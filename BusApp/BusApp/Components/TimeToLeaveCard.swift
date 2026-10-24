import SwiftUI

/// The big card at the top of Home: when to leave for your next class, and how to get there.
///   TIME TO LEAVE                     MA 242 · 3:00 PM
///   Leave in 6 min                          [ Go ]
///   Route 40 · Dunn Ave @ Jeter Dr
///   [🚶 4 min] › [🚌 40 · 9 min] › [🚶 2 min]
///
/// 👉 Issue #30 — see the issue on GitHub for the picture, specs, and hints.
struct TimeToLeaveCard: View {
    let trip: TimeToLeave
    /// What happens when "Go" is tapped
    let onGo: () -> Void
    //Ex: Route 40 · Dunn Ave @ Jeter Dr (description)
    var description : String{ "Route \(trip.route.number) · \(trip.stop.name)"}
    // Ex: Leave in 6 min, or Leave now (with "now" in red) when it's time to go
    var leaveIn : Text{
        if trip.leaveInMinutes == 0 {
            return Text("Leave \(Text("now").foregroundStyle(Color.ncsuRed))")
        }
        return Text("Leave in \(ETAText(minutes: trip.leaveInMinutes).label)")
    }
    // MA 242 * 3:00PM right side of eyebrow
    var eyebrowLocation : String{"\(trip.className) · \(trip.classTime)"
    }
    
    
    var body: some View {
        // TODO (Issue #30): Replace this placeholder with the real card.
        VStack(alignment: .leading, spacing: Spacing.ms){
            HStack{
                Label("TIME TO LEAVE", systemImage: "clock")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.ncsuRed)
                    .tracking(1)
                Spacer()
                Text(eyebrowLocation)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    leaveIn
                        .font(.title2)
                        .bold()
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button(action: onGo){
                    Text("Go")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, Spacing.m)
                        .padding(.vertical, Spacing.s)
                        .background(Color.ncsuRed, in: Capsule())
                }
            }
            
            HStack(spacing: Spacing.xs) {
                ForEach(trip.steps) { step in
                    // Chevron goes between chips, so skip it before the first one
                    if step.id != trip.steps.first?.id {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    TripStepChip(step: step)
                }
            }
        }
        .padding(Spacing.m)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: Radius.card))
    }
}
#Preview {
    VStack(spacing: Spacing.m) {
        TimeToLeaveCard(trip: .sample) {}
        TimeToLeaveCard(trip: .sampleNow) {}
    }
    .padding()
    .background(Color.groupedBackground)
}
