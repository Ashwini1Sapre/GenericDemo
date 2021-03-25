//
//  Modifire.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 19/03/21.
//

import SwiftUI
//import Charts


func add<T: Summable>(x: T, y: T) -> T{
    
    return x + y
    
    
}


func find<T: Equatable>(item:T, inArray:[T]) -> Int?
{
    
    var index:Int = 0
    var found = false
    while (index < inArray.count && found == false)
    {
        
        if item == inArray[index]
        {
            found = true
        }
        else{
            index = index + 1
        }
        
        
    }
    if found{
       
        return index
     
    }
    else
    {
        return nil
    }
   
    
}


func mid<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1) / 2]
}


enum Reward<T> {
    case treasurChest(T)
    case medal
    
    var message: String {
        
        switch self {
        
        case .treasurChest(let treasure):
            return "You got a chest filled with \(treasure)."
        
        case .medal:
            return "Stand proude, ypu earned a medal"
        
        }
        
        
        
        
    }
    
    
    
    
    
    
    
}









struct Title: ViewModifier{
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 14, weight: .semibold))
        
        
    }
    
    
}


struct SubTitle1: ViewModifier{
   
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(Color.gray)
            .font(.system(size: 16, weight: .semibold))
            .lineLimit(1)
       
    }
    
   
}


struct loaderframe: ViewModifier{
    
    func body(content: Content) -> some View {
        
        content
            .frame(width: 200, height: 200)
        
        
    }
    
    
}



struct sparklineModifire: ViewModifier{
    
    func body(content: Content) -> some View {
        
        content
         
            .foregroundColor(Color.gray)
            //.background(Color.red)
            .frame(width: 50, height: 50, alignment: .leading)
         
            .offset(x: 0, y: -10)
        
            //.resizable()
    
    }
   
}


protocol Summable { static func +(lhs: Self, rhs: Self) -> Self}
    
extension Int: Summable {}
extension Double: Summable {}






















