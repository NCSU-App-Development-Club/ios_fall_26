import Foundation

/// A place the user searched for or opened recently, e.g. "Hunt Library" on "Centennial Campus".
/// Home lists these under "Recents".
struct RecentPlace: Identifiable, Hashable {
    let id: String
    let name: String
    /// A second, smaller line, e.g. which campus it's on
    let subtitle: String
}
