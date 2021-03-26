//
//  TestGenericView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 26/03/21.
//

import SwiftUI

protocol BestQModel{
    
    
    
}
struct YesNoQustionViewModel: BestQModel {
    
    
}
protocol PQuestionView: View  {
    associatedtype VM where VM : BestQModel
    var vm: Self.VM { get }
}

struct test: PQuestionView {
    var vm = YesNoQustionViewModel()
    var body: some View {
        VStack {
            Text("Yes")
        }
    }
    
}

struct QustionHolder<T: PQuestionView>: View {
    var qustionviews: [T]
    var body: some View {
        ForEach(0..<qustionviews.count) { i in
            self.qustionviews[i]
        }
        
        
    }
    
    
}



struct TestGenericView_Previews: PreviewProvider {
    static var previews: some View {
        List {
        QustionHolder(qustionviews: [test(),test(),test()])
        }
    }
}
