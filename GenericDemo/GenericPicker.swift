//
//  GenericPicker.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 22/03/21.
//

//import Foundation
//import SwiftUI
//
//class PickerSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
//   
//    
//    
//    var data: [[String]] = []
//    var selectionUpdated: ((_ component: Int, _ row: Int) -> Void)?
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return data.count
//    }
//    
//    // MARK: UIPickerViewDataSource
//    
////    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
////        return data.count
////    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        let rows = data[component]
//        return rows.count
//    }
//    
//    // MARK: UIPickerViewDelegate
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
//        return "\(data[component][row])"
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectionUpdated?(component, row)
//    }
//}
//
//class Picker<T : Printable> : UIPickerView {
//    
//    var data: [[T]] = [] {
//        didSet {
//            source.data = data.map { $0.map { "\($0)" } }
//            reloadAllComponents()
//        }
//    }
//    
//    var selectionUpdated: ((_ selections: [T?]) -> Void)?
//    
//    private let source = PickerSource()
//    
//    // MARK: Initialization
//    
//    convenience init() {
//        self.init(frame: CGRect.zero)
//    }
//    
//    convenience init(data: [[T]]) {
//        self.init(frame: CGRect.zero)
//        self.data = data
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        setup()
//    }
//    
//    // MARK: Setup
//    
//    private func setup() {
//        dataSource = source
//        delegate = source
//        source.selectionUpdated = { [weak self] component, row in
//            if let _self = self {
//                var selections: [T?] = []
//                for (idx, componentData) in enumerate(_self.data) {
//                    let selectedRow = _self.selectedRowInComponent(idx)
//                    if selectedRow >= 0 {
//                        selections.append(componentData[selectedRow])
//                    } else {
//                        selections.append(nil)
//                    }
//                }
//                _self.selectionUpdated?(selections)
//            }
//        }
//    }
//}
