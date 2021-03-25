//
//  GridViewHeaderView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 25/03/21.
//

import SwiftUI






extension HorizontalAlignment {
    
    private enum UndelineLeading: AlignmentID {
       
        
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
        
        
    }
    
    
    static let underlinleading = HorizontalAlignment(UndelineLeading.self)
    
}


struct TextGeometry: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            return Rectangle().fill(Color.clear).preference(key: WidthpreferanseKey.self, value: geometry.size.width)
          
        }
       
    }

}


struct GridViewHeaderView: View {
    @State private var indexNew: Int = 0
    @State private var W: [CGFloat] = [0,0,0,0]
    
    var body: some View {
       
        return VStack(alignment: .underlinleading){
        
        HStack{
            Text("About")
                .modifier(MagicIndex(Activendex: $indexNew, idex1: 0))
                .background(TextGeometry())
                .onPreferenceChange(WidthpreferanseKey.self, perform: { self.W[0] = $0 })
                Spacer()
            
            Text("Profile")
                .modifier(MagicIndex(Activendex: $indexNew, idex1: 1))
                .background(TextGeometry())
                .onPreferenceChange(WidthpreferanseKey.self, perform: { self.W[1] = $0 }
                )
            
            Spacer()
            Text("Setting")
                .modifier(MagicIndex(Activendex: $indexNew, idex1: 2))
                .background(TextGeometry())
                .onPreferenceChange(WidthpreferanseKey.self, perform: { self.W[2] = $0 })
            
            Spacer()
            Text("Logout")
                .modifier(MagicIndex(Activendex: $indexNew, idex1: 3))
                .background(TextGeometry())
                .onPreferenceChange(WidthpreferanseKey.self, perform: { self.W[3] = $0 })
        
        
        }
        .frame(height: 50)
        .padding(.horizontal, 10)
            Rectangle()
                .alignmentGuide(.underlinleading){ d in d[.leading] }
                .frame(width: W[indexNew], height: 2)
                .animation(.linear)
                    
                    
                    
                    
                }
    
    
    
    
        }
    
    }










struct WidthpreferanseKey: PreferenceKey {
    
    static var defaultValue = CGFloat(0)
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    typealias Value = CGFloat
    
}





struct MagicIndex: ViewModifier
{
    @Binding var Activendex: Int
    let idex1: Int
    
    func body(content: Content) -> some View {
        
        
        Group{
            
            if Activendex == idex1 {
                
                content.alignmentGuide(.underlinleading) { d in
                    return d[.leading]
                    
                    
                }.onTapGesture {
                    self.Activendex = self.idex1
                }
                
            }
            else
            {
                
                content.onTapGesture { self.Activendex = self.idex1}
            }
            
            
            
            
        }
    }
    
    
    
    
    
}



struct GridViewHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GridViewHeaderView()
    }
}
