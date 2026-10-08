import Foundation

/// One bus arriving at one stop, e.g. "Route 40 reaches Dunn Ave @ Jeter Dr in 3 min, some seats left".
/// Screens show lists of these. Until we connect the real bus API, use `Arrival.samples`.
struct Arrival: Identifiable, Hashable {
    let id: String
    let route: Route
    let stop: Stop
    /// Minutes until the bus arrives. 0 means it's here now.
    let minutes: Int
    let crowd: CrowdLevel
}
