import Foundation

/// One leg of a trip: walk to the stop, ride the bus, walk to class.
/// The Time to Leave card shows these as chips: [🚶 4 min] › [🚌 40 · 9 min] › [🚶 2 min]
struct TripStep: Identifiable, Hashable {
    /// Whether this leg is on foot or on a bus.
    enum Kind: Hashable {
        /// Walking, e.g. to the stop or to class.
        case walk
        /// Riding a bus. The route rides along with the case (an "associated value").
        case bus(Route)
    }

    /// A fresh unique key for each leg.
    let id = UUID()
    /// Walk or bus.
    let kind: Kind
    /// How long this leg takes, in minutes.
    let minutes: Int
}
