//
//  ActivityViewController.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    
    
    var activityItem: [Any]
    var applecationActviteies: [UIActivity]? = nil
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) ->  UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItem, applicationActivities: applecationActviteies)
        return controller
    }
    
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {
    
    }
    
    
    
    
    
    
    
}



//Use:
//ActivityViewController(activityItems: [URL(string: "https://link.rafa.ai/uEsh")!])
