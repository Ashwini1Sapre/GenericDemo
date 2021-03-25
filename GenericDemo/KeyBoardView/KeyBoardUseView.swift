//
//  KeyBoardUseView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 25/03/21.
//

import SwiftUI

struct KeyBoardUseView: View {
    @State var text = ""

    var body: some View {
        VStack {
        CustomKeyBoardView(text: $text, keyType: UIKeyboardType.phonePad)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            .overlay(
            
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 4)
            
            )
        
        
        
            Button(action: { }) {
              Text("This is a custom button")
               // .foregroundColor(Color.red)
            }.buttonStyle(MyButtonStyleExample(.rounded(type: .danger)))
          //  .frame(width: 200, height: 200)
            //.foregroundColor(Color.white)
        }
    }
}

struct KeyBoardUseView_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoardUseView()
    }
}
