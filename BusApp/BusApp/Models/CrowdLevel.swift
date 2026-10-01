import Foundation

/// How full a bus is (crowdsourced from riders).
enum CrowdLevel: String, CaseIterable, Identifiable {
    case empty = "Empty"
    case some  = "Some seats"
    case full  = "Full"

    var id: String { rawValue }
}
