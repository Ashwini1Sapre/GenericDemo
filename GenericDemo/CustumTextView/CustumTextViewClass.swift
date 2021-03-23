//
//  CustumTextViewClass.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI

struct CustumTextViewClass: UIViewRepresentable {
    @Binding var text: String
    @Binding var TextFont: UIFont.TextStyle
    func makeUIView(context: Context) ->  UITextView {
        
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: TextFont)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.delegate = context.coordinator
        textView.isUserInteractionEnabled = true
        return textView
        
    }
    
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: TextFont)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    
    class Coordinator: NSObject , UITextViewDelegate {
        
        var text: Binding<String>
        
        init(_ text: Binding<String>)
        {
            
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
       
        
    }
    
   
}

