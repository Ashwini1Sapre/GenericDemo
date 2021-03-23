//
//  MainTFView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI

struct MainTFView: View {
    @State private var message = ""
    @State private var textStyle = UIFont.TextStyle.body
    var body: some View {
        ZStack(alignment: .topTrailing){
       
        CustumTextViewClass(text: $message, TextFont: $textStyle)
            .padding(.horizontal)
            LoadingView(loaderTime: "0.10")
            
            Button(action: {
                
               
                
                   
                self.textStyle = (self.textStyle == .body) ? .title1 : .body
               
                
            }){
                Image(systemName: "textformat")
                    .imageScale(.large)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .clipShape(Circle())
                
                
                
            }
            .padding()
            
            
        }
    }
}

struct MainTFView_Previews: PreviewProvider {
    static var previews: some View {
        MainTFView()
    }
}
