//
//  CustumPofileImage.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import SwiftUI

struct CustumPofileImage: View {
    var profile: Profile = Profile(name: "Danny", subtitle: "Awesome iOS Developer", description: "Danny loves SwiftUI and thinks it's the future of iOS Development!", profilePic: "apple-logo")
    var profile2: Profile = Profile(name: "George", subtitle: "An OK iOS Developer", description: "George should love SwiftUI and think that it's the future of iOS Development!", profilePic: "profile")
    @State private var editing = false
    @State private var universalSearch = false
    @State private var serchETxt = ""
    
    var body: some View {
        VStack {
            
           // CustumSearchBar
            
            
            VStack {
                
                CustumSearchBarView(editing: $editing, text: $serchETxt, universalSearch:  $universalSearch, placeholderText: "Search Text")
                ProfilePage(profile: profile)
                ProfilePage(profile: profile2)
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
        CustumPofileImage()
    }
}
