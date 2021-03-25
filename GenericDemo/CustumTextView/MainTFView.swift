//
//  MainTFView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI

struct MainTFView: View {
    @State private var message = ""
    @State private var textStyle =
        UIFont.TextStyle.body
    
    @State var textstr: String = ""
    @State var alertstr: Bool = true
    let items = Array(repeating: "Ram", count: 80)
    var body: some View {
     //   CustumButtonView(.rounded(type: .success))
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
            CustomScrollViewNew {
                        VStack {
                            ForEach(Array(items.enumerated()), id: \.0) { i, item in
                                Text("\(item) - \(i)")
                            }
                        }
                    }
            
            
         //   CustumButtonView(.default(type: .success))
            
            
            
            
            
            
            
            
            
           
           // AlertController(textString: $textstr, showAlert: $alertstr, title: "Welcome", message: "This is custom alert")
         
            
           
        }
    }
}

struct MainTFView_Previews: PreviewProvider {
    static var previews: some View {
        MainTFView()
    }
}
