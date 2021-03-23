//
//  ContentView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 19/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var assignevar = "update Me"
    @State var loading = false
    var body: some View {
        
        
        HStack(alignment: .center, spacing: 0){
            Text("Welcome")
                .modifier(SubTitle1())
              //  .frame(width: 100, alignment: .leading)
            
           // Spacer()
            Image(systemName: "star")
                .resizable()
                .modifier(sparklineModifire())
            VStack {
            
            let addnew = add(x: 12, y: 10)
            Text(String(addnew))
                .modifier(SubTitle1())
                let addnew2 = add(x: 34, y: 10)
                Text(String(addnew2))
                    .modifier(SubTitle1())
            
            }
                
            let sortop = mid(array: [10,12,14,16])
            
            
            
            let message = Reward.treasurChest("chest").message
       
            
           // let strIndex = findIndex(of: "abc", in: ["pqr", "abc", "dff"])
            
            
            let myarr:[String] = ["john", "dave", "tom" , "deep"]
            
            let findindex = find(item: "tom", inArray: myarr)
       //   loading = true
    
            
            Button(action: {
                
                //loading = true
                loading.toggle()
            }, label: {
                Text("ClickLoader")
            })
            if loading {
                
                Rectangle()
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
                        .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.red).opacity(0.3)
                    .blur(radius: 20)
             //   LoadingView(loaderTime: "infinity",filename: "3linearDots")
                LoadingView(loaderTime: "infinity")
                
                
            }
            
            
            
            
        }
        .padding(.leading)
        
        
       
            
           // .padding()
    }
    
    
    
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
           // ContentView()
        }
    }
}
