//
//  JsonStore.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import SwiftUI


class JsonStore {

    static let bundleURL =  Bundle.main.url(forResource: "countries.json", withExtension: nil)!
    
    static func retrieveCountries() -> [Country] {
        let decoder = JSONDecoder()
        guard let data = try? Data(contentsOf: bundleURL) else {
            fatalError("Unable to load country data")
        }
        guard let countries = try? decoder.decode([Country].self, from: data) else {
            fatalError("Failed to decode JSON from the data")
        }
        
        return countries
        
    }
    
    
    
}
