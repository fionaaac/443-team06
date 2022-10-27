//
//  LocationAnnotation.swift
//  MapKitPinDrop
//
//  Created by Fiona Chiu on 2022/10/27.
//

import MapKit
import UIKit

final class LocationAnnotation: NSObject, MKAnnotation {
    let name: String?
    let coordinate: CLLocationCoordinate2D
    
    init (location: Location) {
        self.name = location.name
        self.coordinate = location.coordinate
    }
    
}
