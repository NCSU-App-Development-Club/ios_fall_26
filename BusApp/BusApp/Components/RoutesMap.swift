import SwiftUI
import MapKit

/// The campus map on the Routes screen, with every route's line, its stops, and its buses drawn on top.
struct RoutesMap: View {
    let lines: [RouteLine]
    
    var body: some View {
        // Reuse BusMarker and StopDot for the buses and stops.
        // Starts on the same region as Home's map.
        Map(initialPosition: .region(.campus)){
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
