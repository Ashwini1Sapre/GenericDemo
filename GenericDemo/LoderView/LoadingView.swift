//
//  LoadingView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 19/03/21.
//

import SwiftUI

struct LoadingView: View {
    var loaderTime : String
    var filename : String = "loading"
    var body: some View {
        VStack {
            
            LottieView(filename: filename, time: loaderTime)
                .modifier(loaderframe())
            
            
        }
        
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loaderTime: "infinity")
    }
}
