import CoreLocation

/// Everything the map needs to draw one route: its line, its stops, and where its buses are.
/// For now these are fake (`RouteLine.samples`). Real ones come from the bus API in v2.
struct RouteLine: Identifiable {
    /// The route being drawn. Supplies the line's color.
    let route: Route
    /// The points the line goes through, in order
    let path: [CLLocationCoordinate2D]
    /// Where this route stops, drawn as ``StopDot``s.
    let stops: [MapPin]
    /// Where this route's buses are right now
    let buses: [MapPin]

    var id: String { route.id }
}

/// One spot on the map. `Identifiable` so you can use it in a `ForEach`.
struct MapPin: Identifiable {
    /// A fresh unique key for each pin.
    let id = UUID()
    /// Where the pin sits on the map.
    let coordinate: CLLocationCoordinate2D
}
