//
//  MapViewNew.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI
import MapKit
class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
init(title: String?,
     subtitle: String?,
     coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [LandmarkAnnotation] {
        
        return [
        
            LandmarkAnnotation(title: "welcome", subtitle: "tap to pin", coordinate: .init(latitude: 12.9716, longitude: 77.5946)),
            LandmarkAnnotation(title:"Welcome",
                               subtitle: "tap to pin",
                               coordinate: .init(latitude: 19.0760, longitude: 72.8777))
        
        
        ]
        
       
    }
 
    
}

struct MapViewNew: UIViewRepresentable {
    
    let landmarks = LandmarkAnnotation.requestMockData()
    
    @Binding var showingAlert: Bool
    
    func makeCoordinator() -> MapviewCoordinate
    {
       // MapviewCoordinator(mapView: self, showingAlert: self.$showingAlert)
        
        MapviewCoordinate(mapView: self, showingAlert: self.$showingAlert)
      
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
        
    }
    
    func updateUIView(_ view: MKMapView, context: Context)
    {
        
        view.delegate = context.coordinator
        view.addAnnotations(landmarks)
        
        
        
    }
    
    
    
    
}
   


struct MapViewNew_Previews: PreviewProvider {
    static var previews: some View {
        MapViewNew(showingAlert: Binding<Bool>.constant(true))
    }
}
