//
//  CustumPicker.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//


import SwiftUI
struct CustumPicker: View {
    
    @Binding var presentPicker: Bool
    @Binding var fieldString: String
    
    var placeholer: String
    @Binding var tag: Int
    var slectedTag: Int
    
    
    
    var body: some View
    {
        TextField(placeholer,text: $fieldString).disabled(true)
        
        
            .overlay(
                Button(action: {
                   tag = slectedTag
                    
                    withAnimation {
                        presentPicker = true
                    }
                   
                
                })
                {
                    Rectangle()
                        .foregroundColor(Color.clear)
                    
                    
                    
                }
            
            
            
            )
        
        
    }
    
    
    
}
