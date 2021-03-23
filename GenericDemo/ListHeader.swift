//
//  ListHeader.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 19/03/21.
//

import SwiftUI

struct HeaderList: Identifiable
{
    var id = UUID()
    let name: String = ""
    let isSortable: Bool
    let fontformat: CGFloat = 0
    
    
}

struct watchlistItemIV: Identifiable {
    var name: String
    var ltp: Double?
    var id = UUID()
    
    
}

//extension CaseIterable where Self: Equatable {
//    func next() -> Self {
//        let all = Self.allCases
//        let idx = all.firstIndex(of: self)!
//        let next = all.index(after: idx)
//        return all[next == all.endIndex ? all.startIndex : next]
//    }
//}


extension CaseIterable where Self: Equatable {
    func next() -> Self {
        
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
        
        
        
    }
    
    
}
enum SortDir: CaseIterable{
    case
    ascending,
    descending,
    None
 
}





struct ListHeader<T, V>: View where T: Identifiable ,V: View {
    var collist: [HeaderList]
    
    @Binding var data : [T]
    var itemGenerator: (_ dataItem: T)->V
    var sort : (_ columId: UUID, _ sort: SortDir)->[T]
    
    var dataToDisplay: [T] {
        
        if(currentsortDirection != nil && currentsortedColumnID != nil)
        {
            return sort(currentsortedColumnID!,currentsortDirection!)
        }
        else {
            
            return data
        }
        
        
    }
    
    @State public var currentsortedColumnID: UUID? = nil
    @State public var currentsortDirection: SortDir? = nil
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 0){
                
                ForEach(self.collist){ column in
                    HStack(spacing: 3, content: {
                        if column.name != self.collist.first?.name {
                            
                        }
                        Text(column.name)
                            .foregroundColor(self.currentsortedColumnID == column.id && (self.currentsortDirection == SortDir.descending || self.currentsortDirection ==
                                                                                            SortDir.ascending) ? Color.red : Color.gray)
                        
                            .font(.system(size: 12))
                        
                        if (column.isSortable){
                            
                            VStack(alignment: .leading) {
                                
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .frame(width: 6, height: 4)
                                    .aspectRatio(contentMode: .fill)
                .foregroundColor(self.currentsortedColumnID == column.id &&
                   self.currentsortDirection == SortDir.ascending ?
                                    Color.red : Color.gray)
                                    .offset(y:2.5)
                               
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 6, height: 4)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(self.currentsortedColumnID == column.id  &&
                                                        self.currentsortDirection == SortDir.descending ? Color.red : Color .gray
                                    )
                                    .offset(y:-2.5)
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        
                        if (column.name == self.collist.first?.name)
                        {
                            
                            Spacer()
                        }
                        
                        
                        
                        
                        
                        
                    })
                    
                    .frame(maxWidth: column.fontformat > 0 ?
                            column.fontformat : .infinity,alignment: .trailing)
                    
                    
                    
                    .onTapGesture {
                        
                        if(column.isSortable){
                            if(column.id == currentsortedColumnID){
                                self.currentsortDirection = currentsortDirection!
                                    .next()
                              
                            }
                            else{
                                self.currentsortedColumnID = column.id
                                self.currentsortDirection = SortDir.ascending
                                
                            }
                            
                            if(self.currentsortDirection != nil && self.currentsortedColumnID != nil) {
                                
                                self.data = self.sort(currentsortedColumnID!,currentsortDirection!)
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                }
                .padding(.horizontal)
           
            }
            
            
            List{
                
                ForEach(self.dataToDisplay, id: \.id){
                    dataItem in
                    
                    itemGenerator(dataItem)
                    
                    
                    
                    
                }
                
                
            }
            .listStyle(PlainListStyle())
            
            
            
          
            
        }
        
        
        
        
        
        
    }
}


//struct ListHeader_Previews: PreviewProvider {
//    static var previews: some View {
//       // ListHeader<Any, Any>()
//    }
//}
