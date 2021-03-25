//
//  ButtonActionView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 25/03/21.
//

import SwiftUI

struct CustomButton: UIViewRepresentable {
    var binding: Binding<Int>

    init(number: Binding<Int>) {
        self.binding = number
    }
    func makeUIView(context: Context) -> CustomUIView {
        let customButton = CustomUIView()
        customButton.number = binding
        return customButton
    }

    func updateUIView(_ view: CustomUIView, context: Context) {

    }
}




struct ButtonActionView: View {
    @State var number = 0
    var body: some View {
        
        NavigationView {
            
            Text("I want to show the value of number")
                .lineLimit(nil)
            Text("Cureent value: \(number)")
            CustomButton(number: $number).frame(height: 50)
            
            
        }
        
        
        
    }
}

struct ButtonActionView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonActionView()
    }
}
