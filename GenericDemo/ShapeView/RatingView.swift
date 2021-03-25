//
//  RatingView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 24/03/21.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    
    var body: some View {
       
        
        
        HStack{
            
            if label.isEmpty == false
            {
               Text(label)
            }
            
            
            
            ForEach(1..<self.maximumRating + 1) { number in
                
                self.imageToShow(for: number)
              
                    .foregroundColor(number > self.rating ?? Int(0.0) ? self.offColor : self.onColor)
                  
                    .onTapGesture {
                        
                        self.rating = number
                    }
             
            }
          
            
        }
        
        
        
        
        
        
        
    }
    
    func imageToShow(for no: Int)-> Image
    {
        if no > rating ?? Int(0.0) {
            
            return offImage ?? onImage
            
        }
        else{
            
            return onImage
            
        }
        
        
        
    }
    
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
