//
//  ContextNewView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 31/03/21.
//

import SwiftUI



struct ContextMenuView: View {
  @State var restaurants = [ Restaurant(name: "GoodLuck", image: "cheese-toastie"),
                         Restaurant(name: "Sanjog", image: "full-english"),
                         Restaurant(name: "Sandeep", image: "fillet-steak"),
                         Restaurant(name: "YashRaj", image: "mexican-mocha"),
                         Restaurant(name: "Bar", image: "power-muesli"),
                         Restaurant(name: "GovindGardan", image: "powerhouse-coffee") ]
    
    //Barbeque Nation
    
    var body: some View {
        
        List {
            ForEach(restaurants) { restarant  in
             
                SubbasicRow(restarant: restarant)
                    .contextMenu{
                        
                        Button(action:  {
                       ////  print("Delete Action")
                            self.delete(item: restarant)
                        })
                        {
                            HStack{
                            Text("Delete")
                            Image(systemName: "trash")
                            }
                        }
                        
                        Button(action: {
                        //    print("Fav action")
                            self.isFav(item: restarant)
                            
                        })
                        {
                            HStack{
                                
                                Text("Favirate")
                                Image(systemName: "star")
                                
                            }
                            
                        }
                      
                    }
             
                
            }
            
        }
        
        
    }
    
    private func delete(item restarant:Restaurant){
        
    if let index = self.restaurants.firstIndex(where: { $0.id == restarant.id })
        {
    self.restaurants.remove(at: index)
        
      }
    }
    
    private func isFav(item resturant:Restaurant){
        
        if let index = self.restaurants.firstIndex(where: { $0.id == resturant.id })
        {
            self.restaurants[index].isFavorite.toggle()
        }
        
        
    }
 
    
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}


struct Restaurant: Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool = false
   
}
struct SubbasicRow: View {
    
    var restarant: Restaurant
    
    var body: some View {
      
        HStack {
            Image(restarant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(4)
            
            Text(restarant.name)
            
            if restarant.isFavorite {
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                
            }
            
            
            
        }
        
        
        
        
    }
}
    
    

