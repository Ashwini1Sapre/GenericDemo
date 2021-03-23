//
//  CustumSearchBarView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 23/03/21.
//

import SwiftUI

struct CustumSearchBarView: UIViewRepresentable {
    
    
    @Binding var editing : Bool
    @Binding var text: String
    @Binding var universalSearch : Bool
    
    var placeholderText : String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var editing : Bool
        @Binding var text: String
        @Binding var universalSearch : Bool
        
        init(text: Binding<String>, editing : Binding<Bool>, universalSearch : Binding<Bool>) {
            _editing = editing
            _text = text
            _universalSearch = universalSearch
        
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
        {
            text = searchText
            
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            UIApplication.shared.sendAction(#selector(UIResponder .resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            editing = true
        }
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            editing = false
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            DispatchQueue.main.async {
                self.universalSearch = false
                self.editing = false
                searchBar.text = ""
                searchBar.endEditing(true)
                self.text = ""
            }
        }
        
        
        
        
    }
    
    func makeCoordinator() -> CustumSearchBarView.Coordinator {
        return Coordinator(text: $text, editing: $editing, universalSearch: $universalSearch)
    }
    
    func makeUIView(context: UIViewRepresentableContext<CustumSearchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = self.placeholderText
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.showsCancelButton = true
        return searchBar
        
    }
    
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<CustumSearchBarView>) {
        uiView.text = text
    }
    
    
    
}
