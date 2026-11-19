import Foundation

/// A place the user searched for or opened recently, e.g. "Hunt Library" on "Centennial Campus".
/// Home lists these under "Recents".
struct RecentPlace: Identifiable, Hashable {
    /// Stable unique key, e.g. `"hunt"`.
    let id: String
    /// The place's name, e.g. "Hunt Library".
    let name: String
    /// A second, smaller line, e.g. which campus it's on
    let subtitle: String
}
