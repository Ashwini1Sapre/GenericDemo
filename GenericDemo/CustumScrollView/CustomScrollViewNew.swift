//
//  CustomScrollViewNew.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 24/03/21.
//

import SwiftUI

struct CustomScrollViewNew<Content:View>: UIViewRepresentable {
    
    private let content: UIView
    private let scrollView = UIScrollView()
    
    init(@ViewBuilder content: () -> Content)
    {
        self.content = UIHostingController(rootView: content()).view
        self.content.backgroundColor = .clear
       
    }
    
    
    func makeUIView(context: Context) -> UIView {
        content.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(content)
        
        
        let constraints = [
        
            content.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            content.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            content.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            content.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        
        
        ]
        
        scrollView.addConstraints(constraints)
        return scrollView
        
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
    
    
    
    
}

//struct CustomScrollViewNew_Previews: PreviewProvider {
//    static var previews: some View {
//        let items = Array(repeating: "Ram", count: 50)
//     //   var body: some View {
//
//
//        CustomScrollViewNew{
//            VStack{
//
//                ForEach(Array(items.enumerated()), id:\.0) { i,item in
//
//                    Text("\(item) - \(i)")
//
//                }
//
//
//            }
//
//
//
//     //   }
//        }
//    }
//}
