//
//  MapviewCoordinate.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI
import UIKit
import MapKit

class MapviewCoordinate: NSObject, MKMapViewDelegate {

    var mapViewController: MapViewNew!
    @Binding var showAlert: Bool

    init(mapView: MapViewNew, showingAlert: Binding<Bool>) {

        self.mapViewController = mapView
        self._showAlert = showingAlert
        super.init()
    }

    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
        //Custom View for Annotation
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        annotationView.canShowCallout = true
        //Your custom image icon
        annotationView.image = UIImage(named: "locationPin")
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("calloutAccessoryControlTapped")
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("didSelect")

        self.showAlert = true
    }
}

