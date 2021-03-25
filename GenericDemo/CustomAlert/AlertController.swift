//
//  AlertController.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 24/03/21.
//

import SwiftUI

struct AlertController: UIViewControllerRepresentable {
    
    @Binding var textString: String
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertController>) -> UIViewController {
        return UIViewController()
    }
    func makeCoordinator() -> AlertController.Coordinator {
     
        Coordinator(self)
      
        
    }
    class Coordinator: NSObject, UITextFieldDelegate {
        
        var alert: UIAlertController?
        var control: AlertController
        
        init(_ control:AlertController){
            self.control = control
        }
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

     
            if let text = textField.text as NSString?
            {
                self.control.textString = text.replacingCharacters(in: range, with: string)
            
            }
            else
            {
                self.control.textString = ""
            }
            
            return true
           
        }
        
    }
   
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AlertController>) {
        
        
        guard context.coordinator.alert == nil else {
            return
        }
        
        if self.showAlert {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            context.coordinator.alert = alert
            
            alert.addTextField { textFeild in
                
                textFeild.placeholder = "Enter some Text"
                textFeild.text = self.textString
                textFeild.delegate = context.coordinator
               
            }
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .destructive) { _ in
                
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
                
            })
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Submit", comment: ""), style: .default) { _ in
                
                
                if let textFeild = alert.textFields?.first, let text = textFeild.text {
                    self.textString = text
                }
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            
                
            })
            
            DispatchQueue.main.async {
                
                uiViewController.present(alert, animated: true, completion: {
                    
                    self.showAlert = false
                    context.coordinator.alert = nil
                    
                })
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

//struct AlertController_Previews: PreviewProvider {
//    static var previews: some View {
//      var textString1: String = ""
//       var showAlert: Bool = true
//
//        AlertController(textString: $textString1, showAlert: Binding<Bool>, title: "Welcome", message: "Show Custom Alert")
//    }
//}
