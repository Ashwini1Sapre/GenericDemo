//
//  ProtocolView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 20/03/21.
//

import Foundation


protocol dataProvider {
    associatedtype ProvidedData : DataType
    func giveData() -> ProvidedData
}


class DataConsumer <T: dataProvider> {
    
    var data : T.ProvidedData?
    var DataProvider : T?
    func getData() {
        self.data = self.DataProvider?.giveData()
        
    }
    
    
}

protocol DataType {}

extension DataType{
    func whoAmI() {
        
        print(type(of: self))
    }
    
    
}

struct JSONData : DataType {}

class JSONProvider : dataProvider {
    
    typealias ProvidedData = JSONData
    func giveData() -> JSONData {
        return JSONData()
    }
    
    
}
struct XMLData : DataType {}

class XMLProvider : dataProvider {
    
    typealias ProvidedData = XMLData
    func giveData() -> XMLData {
        return XMLData()
    }
    
    
}



func call(){
    
    let consumer = DataConsumer<JSONProvider>()
    consumer.DataProvider = JSONProvider()
    consumer.getData()
    consumer.data?.whoAmI()
    
    
    
}













