//
//  MapView.swift
//  MapKitPinDrop
//
//  Created by Fiona Chiu on 2022/10/27.
//


import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
    
}

struct MapView: UIViewRepresentable {
    
    let locations: [Location]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        updateMapAnnotations(from: uiView)
    }
    
    private func updateMapAnnotations(from mapView: MKMapView) {
        // put all the nearby location annotations on the map
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.locations.map(LocationAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}

