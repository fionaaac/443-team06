//
//  ContentView.swift
//  MapKitPinDrop
//
//  Created by Fiona Chiu on 2022/10/27.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @State private var search: String = "Search"
    @State private var locations: [Location] = [Location]()
    @State private var tapped: Bool = false
    
    // NKLocalSearch request for nearby landmarks
    private func getNearbyLocations() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        // start the search
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.locations = mapItems.map {
                    Location(placemark: $0.placemark)
                }
                // assign map items to nearby places
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.locations.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        }
        else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView(locations: locations).ignoresSafeArea()
            
            TextField("Search", text: $search, onEditingChanged: { _ in})
            {
                // commit search query
                self.getNearbyLocations()
                
            }.textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                .offset(y: 44)
            LocationListView(locations: self.locations) {
                // display locations on tap
                self.tapped.toggle()
            }
            .animation(Animation.spring())
            .offset(y: calculateOffset())
            
        }
    }
}
