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
