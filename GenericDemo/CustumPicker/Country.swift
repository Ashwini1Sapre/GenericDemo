//
//  Country.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import Foundation

struct Country: Identifiable,Codable {
    var id: UUID? = UUID()
    let name: String
    let code: String
    let flag: String
    let appStore: Bool
}
