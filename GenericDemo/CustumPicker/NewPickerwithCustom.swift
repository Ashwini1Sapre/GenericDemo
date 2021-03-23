//
//  NewPickerwithCustom.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct NewPickerwithCustom: View,CustumPickerrnew {
    
    
    @State private var food = ""
    @State private var country = ""
    @State private var foodArray = ["Milk","Egg","Stawbary","bred","Corn"]
    
   @StateObject private var countriesVM = CountryViewModel()
   @State private var presentPicker = false
    @State private var tag: Int = 1
    
    
    
    
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color(.gray)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        Spacer()
                        CustumPicker(presentPicker: $presentPicker, fieldString: $food, placeholer: "Select a food item", tag: $tag, slectedTag: 1)
                        
                        CustumPicker(presentPicker: $presentPicker, fieldString: $country, placeholer: "select a country", tag: $tag, slectedTag: 2)

                        
                        
                        
                    Image(systemName: "applelogo")
                        .resizable()
                        .frame(width: 200,height: 200)
                        .scaledToFit()
                    Spacer()
                        
                        
                        
                        
                        
                        
                    }
                    
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    .frame(width: 250)
                    
                    .navigationBarTitle("Picker Demo")
                    
                    
                }
                
                
                
            }
            
            if presentPicker {
                
                if tag == 1 {
                    
                    custumPickerView(item: foodArray.sorted(), pickerField: $food, presentPicker: $presentPicker, saveUpdate: saveUpdate)
                        .zIndex(1.0)
                    
                    
                }
                else{
                    
                    custumPickerView(item: countriesVM.countryNameArray, pickerField: $country, presentPicker: $presentPicker)
                    
                        .zIndex(1.0)
                    
                }
                
                
            }
            
            
            
        }
    }
    
    func saveUpdate(_ newItem: String) {
        foodArray.append(newItem)
    }
    
    
    
}

struct NewPickerwithCustom_Previews: PreviewProvider {
    static var previews: some View {
       
        if #available(iOS 14.0, *) {
            NewPickerwithCustom()
        } else {
            // Fallback on earlier versions
        }
        
    }
}
