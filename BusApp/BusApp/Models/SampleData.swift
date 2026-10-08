import SwiftUI

// MARK: - Fake data
//
// Until we connect to the real bus API, every component uses this sample data.
// Use these in your #Preview blocks, e.g. `RouteBadge(route: .sample40)`.

extension Route {
    static let sample40 = Route(id: "40", number: "40", name: "Wolfline 40", color: .routeBlue)
    static let sample41 = Route(id: "41", number: "41", name: "Wolfline 41", color: .routeGreen)
    static let sample3  = Route(id: "3",  number: "3",  name: "Wolfline 3",  color: .routeOrange)
    static let sampleLong = Route(id: "11", number: "11X", name: "Wolfline 11 Express", color: .ncsuRed)

    static let samples: [Route] = [.sample40, .sample41, .sample3, .sampleLong]
}

extension Stop {
    static let sampleNear = Stop(id: "dunn-jeter", name: "Dunn Ave @ Jeter Dr", distanceMeters: 120)
    static let sampleFar  = Stop(id: "talley", name: "Talley Student Union", distanceMeters: 1850)
    static let sampleNoDistance = Stop(id: "hunt", name: "Hunt Library", distanceMeters: nil)

    static let samples: [Stop] = [.sampleNear, .sampleFar, .sampleNoDistance]
}

extension Arrival {
    static let samples: [Arrival] = [
        Arrival(id: "a1", route: .sample40,   stop: .sampleNear,       minutes: 0,  crowd: .some),
        Arrival(id: "a2", route: .sample3,    stop: .sampleNear,       minutes: 12, crowd: .full),
        Arrival(id: "a3", route: .sample40,   stop: .sampleNear,       minutes: 25, crowd: .empty),
        Arrival(id: "a4", route: .sample41,   stop: .sampleFar,        minutes: 5,  crowd: .empty),
        Arrival(id: "a5", route: .sample40,   stop: .sampleFar,        minutes: 8,  crowd: .some),
        Arrival(id: "a6", route: .sample40,   stop: .sampleNoDistance, minutes: 14, crowd: .full),
        Arrival(id: "a7", route: .sampleLong, stop: .sampleNoDistance, minutes: 65, crowd: .empty),
    ]

    /// Every sample arrival at one stop, soonest first.
    /// e.g. `Arrival.at(.sampleNear)`
    static func at(_ stop: Stop) -> [Arrival] {
        samples.filter { $0.stop == stop }.sorted { $0.minutes < $1.minutes }
    }

    /// Every sample arrival on one route, soonest first.
    /// e.g. `Arrival.on(.sample40)`
    static func on(_ route: Route) -> [Arrival] {
        samples.filter { $0.route == route }.sorted { $0.minutes < $1.minutes }
    }
}
