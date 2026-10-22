import SwiftUI

// MARK: - Fake data
//
// Until we connect to the real bus API, every component uses this sample data.
// Use these in your #Preview blocks, e.g. `RouteBadge(route: .sample40)`.

extension Route {
    static let sample40 = Route(id: "40", number: "40", name: "Engineering", color: .routeAqua)
    static let sample41 = Route(id: "41", number: "41", name: "Wolfline 41", color: .routeGreen)
    static let sample3  = Route(id: "3",  number: "3",  name: "Wolfline 3",  color: .routeBlue)
    static let sampleLong = Route(id: "11", number: "11X", name: "Wolfline 11 Express", color: .ncsuRed)
    static let sample30 = Route(id: "30", number: "30", name: "Wolf Village", color: .routeIndigo)
    static let sample20 = Route(id: "20", number: "20", name: "Centennial", color: .routeOrange)

    static let samples: [Route] = [.sample40, .sample41, .sample3, .sampleLong, .sample30, .sample20]

    /// The user's saved routes, as shown on Home.
    static let saved: [Route] = [.sample30, .sample40, .sample20]
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
