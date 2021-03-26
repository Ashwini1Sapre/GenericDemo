//
//  BsicDEmoGeneric.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 20/03/21.
//

import Foundation

let intArr = [1,2,4,5,6,9,23,45]
let abcArray = ["a","b","c","d","e","f","g"]





func linearSearch<T:Comparable> (_ array:[T], key:T) -> Int? {
    
    for (index, elememt) in array.enumerated() {
        if elememt == key {
            
            return index
        }
        
        
    }
    return nil
    
    
    
}



func addDemo<T: Numeric>( x:T, y: T) -> T
{
    return x+y
    
    
}


//func sortGeneric<T: Comparable>(array: [T]) -> [T] {
//    if array.isEmpty { return [] }
//    
//    let first = array.first!
//    
//    let smallorEqual = array.dropFirst().filter { $0 <= first }
//    let large = array.dropFirst().filter { $0 > first }
//    
//    return sortGeneric(array: smallorEqual) + [first] + sortGeneric(array: large)
//    
//    
//}


func callfunction ()
{
    let arrSort = ["dff","c","John","R","a","hey"]
    let arrNumSort = [1.4,2,1.7,3,5,4]
    
    let resulrarr = sortGeneric(array: arrSort)
    print(resulrarr)
    
    let resultarr1  = sortGeneric(array: arrNumSort)
    print(resultarr1)
    
  
}


func sortGeneric<T: Comparable>(array: [T]) -> [T] {
    if array.isEmpty { return [] }
    
    let first = array.first!
    
    let smallorEqual = array.dropFirst().filter { $0 <= first }
    let large = array.dropFirst().filter { $0 > first }
    
    return sortGeneric(array: smallorEqual) + [first] + sortGeneric(array: large)
   
}


let arrStr = ["a", "x", "R", "hey", "c", "Jon Snow"]
let arrDouble = [1.4, 6.7, 9.2, 6.4, 1.4]
let arrNum = [6, 4, 7, 9, 22, 78, 11, 1, 0, 234]

//quickSort(arrNum)    // [0, 1, 4, 6, 7, 9, 11, 22, 78, 234]
let resultarr = sortGeneric(array: arrStr)
//print(resultarr)// ["Jon Snow", "R", "a", "c", "hey", "x"]
let resultarr1 = sortGeneric(array: arrDouble)
//print(resultarr1)
let resultarr2 = sortGeneric(array: arrNum)
//print(resultarr2)



//linearSearch(intArr, key: 23)






