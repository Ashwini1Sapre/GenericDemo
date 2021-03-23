//
//  Profile.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

class Profile{
    var name: String = ""
    var subtitle: String = ""
    var description: String = ""
    var profilePic: String = ""
    
    init(name: String, subtitle: String, description: String, profilePic: String) {
        self.name = name
        self.subtitle = subtitle
        self.description = description
        self.profilePic = profilePic
    }
}
