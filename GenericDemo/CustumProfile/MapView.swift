//
//  MapView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
  
    
    
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        view.setRegion(region, animated: true)
        
        
        
    }
    
    
    
   
}



//struct MapView_Previews: PreviewProvider {
//    typealias Previews = typealias
//    
//    
//    static var Preview: some View
//    {
//        MapView(
//        
//    }
//    
//}

