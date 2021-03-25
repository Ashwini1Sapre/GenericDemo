//
//  ButtonView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 24/03/21.
//

import SwiftUI

protocol AccentColoured {
    static var primaryColor: Color?  { get }
    static var secondaryColor: Color? { get }
}

extension AccentColoured {
    static var secondaryColor: Color? {
        Color.white
    }
}

struct primaryConfigue: AccentColoured {
    //static var secColor: Color?
    
    
    static var primaryColor: Color? {
        
        
        Color.red
    }
    
    
    
    
}

struct successConfigue: AccentColoured {
 //   static var secColor: Color?
    
    
    static var primaryColor: Color?{
        
        Color.blue
        
    }
    
}


struct warningConfigue: AccentColoured {
  //  static var secColor: Color?
    
    
    static var primaryColor: Color? {
        
        Color.orange
    }
    
}



struct dangerConfigue: AccentColoured {
   //static var secColor: Color?
    
    static var primaryColor: Color? {
        Color.red
    }
    
}

struct darkConfigue: AccentColoured {
   // static var secColor: Color?
    
    
    static var primaryColor: Color? {
        
        Color.black
    }
    
}














enum ButtonStyles {
    case primary, success, warning, danger, dark
    
    var secondaryColor: Color? {
        switch self {
        case .dark:
            return darkConfigue.secondaryColor
            
        case .primary:
            return primaryConfigue.secondaryColor
            
        default:
            return Color.white
        }
    }
    
    var primaryColor: Color? {
        switch self {
        case .primary:
            return primaryConfigue.primaryColor
            
        case .dark:
            return darkConfigue.primaryColor
            
        case .success:
            return successConfigue.primaryColor
            
       
            
        case .warning:
            return warningConfigue.primaryColor
            
        case .danger:
            return dangerConfigue.primaryColor
            
      
       
        }
    }
}










protocol ButtonStyleConfig {
    var foregroundColor: Color? { get }
    var backgroundColor: Color? { get }
    var brderColor: Color { get }
    var borderWidth: CGFloat { get }
    var cornerRadius: CGFloat { get }
}


enum DisplayStyle: ButtonStyleConfig {
   
    
    
    case `default`(type: ButtonStyles = .primary)
    case transparent(type: ButtonStyles = .primary)
    case outline(type: ButtonStyles = .primary)
    case rounded(type:  ButtonStyles = .primary)
    
    var foregroundColor: Color?{
        
        switch self {
        
        case .default(let type):
            return type.primaryColor
        
        case .transparent(let type):
            return type.primaryColor
        
        case .outline(let type):
            return type.primaryColor
        
        case .rounded(let type):
            return type.secondaryColor
        }
        
        
    }
    
    var backgroundColor: Color?{
        switch self {
        case .default(let type):
            return type.primaryColor
            
        case .outline(let type):
            return type.primaryColor
            
        case .transparent(let type):
            return type.secondaryColor
        
        case .rounded(let type):
            return type.primaryColor
        }
    
        
    }
    
    var borderColor: Color {
        
        if case .outline(let type) = self {
            
            return type.primaryColor ?? Color.black
        }
        
        return Color.clear
        
    }
    
   
    
    var cornerRadius: CGFloat {
        
        if case .rounded(_) = self {
            return 40
        }
        
        return 6
        
    }
    
    
    
    
    
}

enum Size {
    case `default`,small,large
    
    
    func getFont() -> Font {
        
        switch self {
        case .small:
            return Font.caption
            
        case .large:
            return Font.title
        default:
            return Font.body
        }
        
        
        
    }
    
    
    
}

struct ButtonView: View {
    var body: some View {
        VStack {
            Button(action: { }) {
              Text("This is a custom button")
               // .foregroundColor(Color.red)
            }.buttonStyle(MyButtonStyleExample(.rounded(type: .danger)))
          //  .frame(width: 200, height: 200)
            //.foregroundColor(Color.white)
        }
    }
}





struct MyButtonStyleExample: ButtonStyle {

    
   
  
    
   private var display: DisplayStyle
    private var font: Font
    typealias Configuration = ButtonStyleConfiguration
    
    
   
    
    init(_ display: DisplayStyle = .default(type: .primary),size: Size = .default) {
        
        self.display = display
        font = size.getFont()
        
        
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .font(font)
            .background(display.backgroundColor)
            .foregroundColor(display.foregroundColor)
            .cornerRadius(display.cornerRadius)
            .opacity(configuration.isPressed ? 0.7 : 2)
            .shadow(color: display.backgroundColor!.opacity(0.2), radius: display.cornerRadius, x: 0, y: 5 )
        
//            .overlay(
//                RoundedRectangle(cornerRadius: display.cornerRadius)
//                    .stroke(display.borderColor,lineWidth: 3)
//            
//            
//            )
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(Animation.spring(response: 0.8, dampingFraction: 0.1, blendDuration: 10))
        
        
        
        
        
    }
    
    
  
    
    
    
    

}


//struct ButtonView: View {
//    
//        var body: some View {
//            CustumButtonView(.rounded(type: .success))
//        }
//    
//    
//}






extension ButtonStyleConfig {
    
    var brderColor: Color {
        Color.clear
        
    }
    
    var borderWidth: CGFloat {
        
        6.0
    }
    var cornerRadius: CGFloat {
        
        6.0
    }
    
    
}


struct ButtonView_Previews: PreviewProvider{
    static var previews: some View
    {
        ButtonView()
        
    }
    
    
}
