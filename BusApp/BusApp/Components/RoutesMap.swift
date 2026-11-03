import SwiftUI
import MapKit

/// The campus map on the Routes screen, with every route's line, its stops, and its buses drawn on top.
struct RoutesMap: View {
    let lines: [RouteLine]
    
    private let campus = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.7800, longitude: -78.6690), // replace with current location?
        span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)
    )
    
    var body: some View {
        // Reuse BusMarker and StopDot for the buses and stops.
        Map(initialPosition: .region(campus)){
            ForEach(lines) { line in
                MapPolyline(coordinates: line.path).stroke(line.route.color, lineWidth: 4)
                ForEach(line.stops){stop in
                    Annotation("Stop", coordinate: stop.coordinate){
                        StopDot(color: line.route.color)
                    }
                    .annotationTitles(.hidden)
                }
                ForEach(line.buses) { bus in
                    Annotation("Route \(line.route.number)", coordinate: bus.coordinate) {
                        BusMarker(route: line.route)
                    }
                    .annotationTitles(.hidden)
                }
            }
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
        
    }
}

#Preview {
    RoutesMap(lines: RouteLine.samples)
}
