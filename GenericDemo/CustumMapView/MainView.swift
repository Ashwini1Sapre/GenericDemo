//
//  MainView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI

struct MainView: View {
    @State var text = ""
    @State var ShowAlet: Bool

    @State var textstr: String = ""
    @State var alertstr: Bool = true
    @State var rating: Int?

    
    var body: some View {
        VStack
        {
          
 
            MapViewNew(showingAlert: $ShowAlet)
                .alert(isPresented: $ShowAlet) { () -> Alert in
                    
                    return Alert(title: Text("Welcome"), message: Text("Tap to click"), dismissButton: .default(Text("hit it")))
                    
                    
                }
            
            HStack{
            RatingView(rating: $rating,maximumRating: 5)
                Text(rating != nil ? "Your rating: \(rating!)" : "")
                
              
        
            }
         
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(ShowAlet: true)
    }
}
