//
//  FileToShowView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 26/03/21.
//

import SwiftUI

struct FileToShowView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        
        self.content = content()
        
    }
    
    var body: some View {
        content
    }
}

struct SimpleView: View {
    var body: some View {
        
        FileToShowView{
            
            Text("SimpleView Text")
        }
      
    }
   
}

struct IFElseView: View {
    
    var flag = true
    
    var body: some View {
        FileToShowView {
            if flag {
                Text("True text")
                
            } else {
                Text("false text")
            }
            
        }
    
    }
   
}

struct SwitchCaseView: View {
    var condition = 1
    
    var body: some View  {
        FileToShowView {
            
            switch condition {
            case 1:
            Text("One")
            case 2:
                Text("Two")
            default:
                Text("Default")
            
            }
          
        }
        
      
    }
   
}


struct GreedyContainerview<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View{
        
        Color.clear
            .overlay(content)
       
    }
   
}



struct FileToShowView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}
