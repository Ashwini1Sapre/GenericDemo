//
//  ButtontabcustomView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 25/03/21.
//


import SwiftUI
import UIKit

class CustomUIView: UIView {
    var number: Binding<Int>!
   // @Binding var number: Int
    
  //  @Binding var number: Int

    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.createButton()
    }

    private func createButton () {
        let button = UIButton();
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    @objc func buttonTapped(sender: UIButton) {
        self.number.wrappedValue += 1
    }
}
