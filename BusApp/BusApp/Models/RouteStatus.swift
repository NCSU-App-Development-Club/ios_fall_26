import Foundation

/// One route and when its next bus comes. The Routes screen shows one tile per `RouteStatus`.
struct RouteStatus: Identifiable, Hashable {
    let route: Route
    /// Minutes until the next bus. Optional (`Int?`): `nil` means no bus is running on this route right now.
    let minutes: Int?

    var id: String { route.id }
}
