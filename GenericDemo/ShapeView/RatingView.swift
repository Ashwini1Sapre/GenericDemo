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
    @State var selectedSector = ""
    @State var fundsSectors = [SectorCustomModel(sector: "media", fundsize: 30.0),
                               SectorCustomModel(sector: "education", fundsize: 40.0),
                               SectorCustomModel(sector: "mask", fundsize: 20.0)
                               
    ]
    
    
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
            VStack {
            PieChartsView1(sectors: fundsSectors, sectorLabel: $selectedSector)
            
            BarChartView1(plotPoints: [330,500,800,200,300])
                let dataShowarr = [DataPoints(xVal: "29", yVal: 120.30),DataPoints(xVal: "", yVal: 189.20)]
             //   LineChartView1(plotPoints: dataShowarr, color: "red", tapIndex: .constant(0), xpos: .constant(0.0), ypos: .constant(0.0))
                
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
    @State var rating: Int?

    static var previews: some View {
        
        RatingView(rating: .constant(4))
    }
}
