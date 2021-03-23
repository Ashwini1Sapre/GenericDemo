//
//  CustumPofileImage.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import SwiftUI
import MapKit

struct CustumPofileImage: View {
    var profile: Profile = Profile(name: "Danny", subtitle: "Awesome iOS Developer", description: "Danny loves SwiftUI and thinks it's the future of iOS Development!", profilePic: "apple-logo")
    var profile2: Profile = Profile(name: "George", subtitle: "An OK iOS Developer", description: "George should love SwiftUI and think that it's the future of iOS Development!", profilePic: "profile")
    @State private var editing = false
    @State private var universalSearch = false
    @State private var serchETxt = ""
    
    @State var text = ""
    @State var showingAlert: Bool
    
    var body: some View {
        VStack {
             // CustumSearchBar
            //for share your app
         //   ActivityViewController(activityItem: [URL(string: "https://www.lokmat.com")!])
            MapViewNew(showingAlert: $showingAlert)
                .alert(isPresented: self.$showingAlert) { ()-> Alert  in
                    
                    
                    return Alert(title: Text("IMP"), message: Text("Go To Tab it"), dismissButton: .default(Text("got it....")))
                    
                    
                    
                    
                }
            
            
            
            VStack {
                
                CustumSearchBarView(editing: $editing, text: $serchETxt, universalSearch:  $universalSearch, placeholderText: "Search Text")
                ProfilePage(profile: profile)
                ProfilePage(profile: profile2)
                
                
                
                
                
               // var center = mapView.centerCoordinate
             //   MapView(coordinate:)
                
                
            ///////   custumSearchBarView
                
            }
            
            
        }
    }
}


struct ProfilePage: View {
    var profile: Profile
    
    var body: some View {
    
        VStack {
            Image(profile.profilePic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.horizontal)
                .overlay(Circle().stroke(Color.gray, lineWidth: 10))
                .foregroundColor(.blue)
           //ProfileInformation(profile: profile)
            Spacer()
           
            
            
        }
        VStack{
            
            
            Text(profile.name)
                .font(.largeTitle)
            Text(profile.subtitle)
                .font(.subheadline)
            Text(profile.description)
                .font(.body)
            
            
        }
    .padding()
    }
}

struct CustumPofileImage_Previews: PreviewProvider {
    static var previews: some View {
        CustumPofileImage(showingAlert: true)
    }
}
