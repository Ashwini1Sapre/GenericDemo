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
    @State var textstr: String = ""
    @State var alertstr: Bool = true
    var body: some View {
        VStack {
            
            LottieView(filename: filename, time: "0.5")
                .modifier(loaderframe())
            
            AlertController(textString: $textstr, showAlert: $alertstr, title: "Welcome", message: "This is custom alert")
            
        }
        
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loaderTime: "infinity")
    }
}
