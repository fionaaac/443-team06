//
//  Location.swift
//  MapKitPinDrop
//
//  Created by Fiona Chiu on 2022/10/27.
//

import Foundation
import MapKit
import CoreLocation

struct Location: Identifiable, Equatable {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    var name: String {
        self.placemark.name ?? ""
    }
//    let latitude: Double
//    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
//        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // Comparable functions
//    static func < (lhs: Location, rhs: Location) -> Bool {
//
//    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

