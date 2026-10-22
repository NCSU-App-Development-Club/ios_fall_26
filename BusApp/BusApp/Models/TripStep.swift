import Foundation

/// One leg of a trip: walk to the stop, ride the bus, walk to class.
/// The Time to Leave card shows these as chips: [🚶 4 min] › [🚌 40 · 9 min] › [🚶 2 min]
struct TripStep: Identifiable, Hashable {
    enum Kind: Hashable {
        case walk
        /// Riding a bus. The route rides along with the case (an "associated value").
        case bus(Route)
    }

    let id = UUID()
    let kind: Kind
    /// How long this leg takes, in minutes.
    let minutes: Int
}
