//
//  CountryViewModel.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import Foundation

class CountryViewModel: NSObject, ObservableObject {
    
    @Published var countries = [Country]()
    
    
    var countryNameArray:[String]{
        
        countries.map{"\($0.flag)\($0.name)"}.sorted()
    }
    
    override init() {
        countries = JsonStore.retrieveCountries()
    }
    
    
}
