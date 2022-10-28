//
//  File.swift
//  MapKit1
//
//  Created by Fiona Chiu on 2022/10/26.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // Comparable functions
//    static func < (lhs: Location, rhs: Location) -> Bool {
//
//    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
