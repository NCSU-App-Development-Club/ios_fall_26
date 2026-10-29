import SwiftUI
import CoreLocation

// MARK: - Fake data
//
// Until we connect to the real bus API, every component uses this sample data.
// Use these in your #Preview blocks, e.g. `RouteBadge(route: .sample40)`.

extension Route {
    static let sample40 = Route(id: "40", number: "40", name: "Engineering", color: .routeAqua)
    static let sample41 = Route(id: "41", number: "41", name: "Avent Ferry", color: .routeOlive)
    static let sample3  = Route(id: "3",  number: "3",  name: "Wolfline 3",  color: .routeBlue)
    static let sampleLong = Route(id: "11", number: "11X", name: "Wolfline 11 Express", color: .ncsuRed)
    static let sample30 = Route(id: "30", number: "30", name: "Wolf Village", color: .routeIndigo)
    static let sample20 = Route(id: "20", number: "20", name: "Centennial", color: .routeOrange)

    static let samples: [Route] = [.sample40, .sample41, .sample3, .sampleLong, .sample30, .sample20]

    /// The user's saved routes, as shown on Home.
    static let saved: [Route] = [.sample30, .sample40, .sample20]

    // The rest of the routes on the Routes screen. "Name TBD" until the designers pick names.
    static let sample42 = Route(id: "42", number: "42", name: "Name TBD", color: .routeSlate)
    static let sample43 = Route(id: "43", number: "43", name: "Name TBD", color: .routeMaroon)
    static let sample51 = Route(id: "51", number: "51", name: "Name TBD", color: .routeBlack)
    static let sample52 = Route(id: "52", number: "52", name: "Name TBD", color: .ncsuRed)
    static let sample60 = Route(id: "60", number: "60", name: "Vet School", color: .routeYellow)
    static let sampleUnknown1 = Route(id: "tbd-1", number: "?", name: "Name TBD", color: .routeUnknown)
    static let sampleUnknown2 = Route(id: "tbd-2", number: "?", name: "Name TBD", color: .routeUnknown)

    /// Every route, in the order the Routes screen shows them.
    static let all: [Route] = [
        .sample20, .sample30, .sample40,
        .sample41, .sample42, .sample43,
        .sample51, .sample52, .sample60,
        .sampleUnknown1, .sampleUnknown2,
    ]
}

extension Stop {
    static let sampleNear = Stop(id: "dunn-jeter", name: "Dunn Ave @ Jeter Dr", distanceMeters: 120)
    static let sampleFar  = Stop(id: "talley", name: "Talley Student Union", distanceMeters: 1850)
    static let sampleNoDistance = Stop(id: "hunt", name: "Hunt Library", distanceMeters: nil)

    static let samples: [Stop] = [.sampleNear, .sampleFar, .sampleNoDistance]
}

extension TripStep {
    static let sampleWalkToStop = TripStep(kind: .walk, minutes: 4)
    static let sampleBus40      = TripStep(kind: .bus(.sample40), minutes: 9)
    static let sampleWalkToClass = TripStep(kind: .walk, minutes: 2)

    static let samples: [TripStep] = [.sampleWalkToStop, .sampleBus40, .sampleWalkToClass]
}

extension TimeToLeave {
    static let sample = TimeToLeave(
        className: "MA 242",
        classTime: "3:00 PM",
        leaveInMinutes: 6,
        route: .sample40,
        stop: .sampleNear,
        steps: TripStep.samples
    )

    /// Same trip, but it's time to go right now.
    static let sampleNow = TimeToLeave(
        className: "CSC 216",
        classTime: "10:15 AM",
        leaveInMinutes: 0,
        route: .sample30,
        stop: .sampleFar,
        steps: [TripStep(kind: .walk, minutes: 2), TripStep(kind: .bus(.sample30), minutes: 12)]
    )
}

extension RecentPlace {
    static let samples: [RecentPlace] = [
        RecentPlace(id: "hunt", name: "Hunt Library", subtitle: "Centennial Campus"),
        RecentPlace(id: "talley", name: "Talley Student Union", subtitle: "Main Campus"),
        RecentPlace(id: "dh-hill", name: "D.H. Hill Jr. Library", subtitle: "Main Campus"),
    ]
}

extension RouteStatus {
    /// One per route on the Routes screen. The last two have no bus right now (`minutes` is nil).
    static let samples: [RouteStatus] = [
        RouteStatus(route: .sample20, minutes: 12),
        RouteStatus(route: .sample30, minutes: 4),
        RouteStatus(route: .sample40, minutes: 9),
        RouteStatus(route: .sample41, minutes: 7),
        RouteStatus(route: .sample42, minutes: 15),
        RouteStatus(route: .sample43, minutes: 6),
        RouteStatus(route: .sample51, minutes: 11),
        RouteStatus(route: .sample52, minutes: 18),
        RouteStatus(route: .sample60, minutes: 22),
        RouteStatus(route: .sampleUnknown1, minutes: nil),
        RouteStatus(route: .sampleUnknown2, minutes: nil),
    ]
}

extension RouteLine {
    /// Fake lines near the middle of campus. Not real Wolfline paths: those come from the bus API in v2.
    static let samples: [RouteLine] = [.sample30, .sample40, .sample20]

    /// Runs east–west along the top, like Hillsborough St.
    static let sample30 = RouteLine(
        route: .sample30,
        path: [
            CLLocationCoordinate2D(latitude: 35.7873, longitude: -78.6760),
            CLLocationCoordinate2D(latitude: 35.7883, longitude: -78.6620),
        ],
        stops: [
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7875, longitude: -78.6728)),
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7880, longitude: -78.6660)),
        ],
        buses: [
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7878, longitude: -78.6694)),
        ]
    )

    /// A "U" hanging off route 30: down the left side, along the bottom, back up the right.
    static let sample40 = RouteLine(
        route: .sample40,
        path: [
            CLLocationCoordinate2D(latitude: 35.7875, longitude: -78.6728),
            CLLocationCoordinate2D(latitude: 35.7823, longitude: -78.6725),
            CLLocationCoordinate2D(latitude: 35.7828, longitude: -78.6655),
            CLLocationCoordinate2D(latitude: 35.7880, longitude: -78.6660),
        ],
        stops: [
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7828, longitude: -78.6655)),
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7825, longitude: -78.6690)),
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7823, longitude: -78.6725)),
        ],
        buses: [
            MapPin(coordinate: CLLocationCoordinate2D(latitude: 35.7852, longitude: -78.6727)),
        ]
    )

    /// No bus right now, so just the line.
    static let sample20 = RouteLine(
        route: .sample20,
        path: [
            CLLocationCoordinate2D(latitude: 35.7802, longitude: -78.6652),
            CLLocationCoordinate2D(latitude: 35.7801, longitude: -78.6712),
            CLLocationCoordinate2D(latitude: 35.7760, longitude: -78.6738),
        ],
        stops: [],
        buses: []
    )
}
