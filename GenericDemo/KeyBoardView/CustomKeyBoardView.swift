//
//  CustomKeyBoardView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 25/03/21.
//

import Foundation
import SwiftUI

struct CustomKeyBoardView: UIViewRepresentable {
    
    @Binding var text: String
    var keyType: UIKeyboardType
    
    func makeUIView(context: Context) -> UITextField {
        let textfeild = UITextField()
        textfeild.keyboardType = keyType
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textfeild.frame.size.width, height: 40))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textfeild.doneButtonTapped(button:)))
        
        toolBar.items = [doneButton]
        toolBar.setItems([doneButton], animated: true)
        textfeild.inputAccessoryView = toolBar
        return textfeild
        
        
        
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    
 
    
}

extension UITextField{
    
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void
    {
        
        self.resignFirstResponder()
    }
    
    
    
}
