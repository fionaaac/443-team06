import SwiftUI
import MapKit

struct ContentView: View {
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(40.444230, -79.945530), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var locations: [Location] = []
    @State private var selectedPlace: Location?
    
    func addPin() {
        
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) {
                location in MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                        Text(location.name).font(.system(size: 12))
                    }
                    .onTapGesture {
                        selectedPlace = location
                    }
                }
            }
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
    
            VStack {
                Spacer().frame(height: 700)
                HStack {
                    Spacer()
                    Button {
                        let newLocation = Location(id: UUID(), name: "new location", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.blue.opacity(0.75))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.trailing)
                }.sheet(item: $selectedPlace) { place in
                    Text(place.name)
                    Text("Add a memory")
                    Button {
                        //
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
        }
//        .sheet(item: $selectedPlace) { place in
//            Text(place.name)
//            Text("placeholder for other stuff")
//        }
}
