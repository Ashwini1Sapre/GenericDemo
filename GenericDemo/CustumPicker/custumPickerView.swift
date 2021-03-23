//
//  custumPickerView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

import SwiftUI


protocol CustumPickerrnew {
    func saveUpdate(_ newItem: String)
}
struct custumPickerView: View {
    
    var item: [String]
    @State private var filteredItems: [String] = []
    @State private var filterString: String = ""
    @State private var frameHeight: CGFloat = 400
    @Binding var pickerField: String
    @Binding var presentPicker: Bool
    var saveUpdate: ((String) -> Void)?
    
    var body: some View
    {
        let filterBinding = Binding<String> (
            get: { filterString },
            set: {
                filterString = $0
                if filterString != ""{
                    filteredItems = item.filter{$0
                        .lowercased()
                        .contains(filterString.lowercased())}
                    
                }
                else
                {
                  filteredItems = item
                    
                }
                
                setHeight()
                
            }
        
        
        )
        
        
        return ZStack {
            
            Color.black.opacity(0.4)
            VStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        
                        Button(action: {
                            withAnimation {
                                presentPicker = false
                            }
                            
                            
                        }){
                            Text("Cancel")
                        }
                        
                        .padding(10)
                        Spacer()
                        
                        if let saveUpdate = saveUpdate {
                            Button(action: {
                                if !item.contains(filterString){
                                    saveUpdate(filterString)
                                    
                                }
                                pickerField =
                                filterString
                                withAnimation {
                                    
                                    presentPicker = false
                                }
                           
                            }) {
                                
                                Image(systemName: "plus.circle")
                                    .frame(width: 44, height: 44)
                            }
                            .disabled(filterString.isEmpty)
                            
                          
                        }
                        
                        
                        
                        
                    }
                    .background(Color.gray)
                    .foregroundColor(.white)
                    Text("Tap an empty to select a new entry")
                        .font(.caption)
                        .padding(.leading,10)
                    TextField("Filter by entering text", text: filterBinding)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    List{
                        ForEach(filteredItems, id:  \.self)
                            { item in
                            Button(action: {
                                pickerField = item
                                
                                withAnimation {
                                    presentPicker = false
                                }
                                
                            })
                            {
                                Text(item)
                            }
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                .background(Color(UIColor
                                    .secondarySystemBackground))
   
                .cornerRadius(10)
                .frame(maxWidth: 400)
                .padding(.horizontal,10)
                .frame(height: frameHeight)
                .padding(.top, 40)
                Spacer()
                
                
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            
            filteredItems = item
            setHeight()
        }
        
        
        
    }
    
    
    fileprivate func setHeight(){
        withAnimation {
            if filteredItems.count > 5 {
                frameHeight = 400
                
            }
            else if filteredItems.count == 0 {
                
                frameHeight = 130
            }
            else {
                frameHeight = CGFloat(filteredItems.count * 45 + 130)
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
    }
    
    
    

    
}



struct custumPickerView_Previews: PreviewProvider {
    
    static let sampleData = ["milk", "Apple","Sugar","Egg","Orange",]
    
    static var previews: some View {
        
        custumPickerView(item: sampleData, pickerField: .constant(""),
                         presentPicker: .constant(true))
        
    }
}











