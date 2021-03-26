//
//  BarChartView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 26/03/21.
//

import SwiftUI
import Charts

struct BarChartView1: UIViewRepresentable {
    typealias UIViewType = BarChartView
    var plotPoints: [Float]
    
//    typealias UIViewType1 = BarChartView
//    var plotPoints1: [Float]
//
    
    
    
    class Coordinator: NSObject, ChartViewDelegate{
        
//        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//
//        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func makeCoordinator() -> BarChartView1.Coordinator {
        return Coordinator()
    }
    
    
    func makeUIView(context: Context) -> BarChartView {
        let barChart = BarChartView()
    //    barChart.chartDescription?.enabled = false
     //   barChart.delegate = context.coordinator
        
        barChart.chartDescription?.enabled = false
        barChart.delegate = context.coordinator
        
        
//        barChart.pinchZoomEnabled = false
//        barChart.doubleTapToZoomEnabled = false
        
        barChart.pinchZoomEnabled = false
        barChart.doubleTapToZoomEnabled = false
        
//        barChart.dragEnabled = false
//        barChart.legend.enabled = false
        
        barChart.dragEnabled = false
        barChart.legend.enabled = false
        
//        barChart.xAxis.enabled = false
//        barChart.xAxis.drawGridLinesEnabled = false
        
        barChart.xAxis.enabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        
        
//        barChart.leftAxis.enabled = false
//        barChart.leftAxis.drawGridLinesEnabled = false
        
        barChart.leftAxis.enabled = false
        barChart.leftAxis.drawGridLinesEnabled = false
        
        
        
//        barChart.rightAxis.enabled = false
//        barChart.data = generateBarData()
        
        
        barChart.rightAxis.enabled = false
        barChart.data = generateBarData()
        
//        barChart.highlightPerTapEnabled = true
//        barChart.drawValueAboveBarEnabled = true
        
        
        barChart.highlightPerTapEnabled = true
        barChart.drawValueAboveBarEnabled = true
        
        return barChart
      
        
    }
    
    func generateBarData() -> BarChartData {
        
//        let entries1 = (0..<plotPoints.count).map { (i) -> BarChartDataEntry in
//
//         return BarChartDataEntry(x: Double(i), y: Double(plotPoints[i]))
//
//        }
        
        let entries1 = (0..<plotPoints.count).map { (i) -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i), y: Double(plotPoints[i]))
            
            
        }
        
        
        
        
        
        let set1 = BarChartDataSet(entries: entries1, label: "Bar 1")
        set1.setColor(UIColor.gray)
        set1.valueTextColor = UIColor.red
        set1.valueFont = .systemFont(ofSize: 10)
        set1.drawValuesEnabled = false
        set1.axisDependency = .left
        let barWidth = 1.0
        let data = BarChartData(dataSets: [set1])
        data.barWidth = barWidth
        
        return data
        
        
//        let set1 = BarChartDataSet(entries: entries1, label: "Bar 1")
//        set1.setColor(UIColor.gray)
//        set1.valueTextColor = UIColor.red
//        set1.valueFont = .systemFont(ofSize: 10)
//        set1.drawValuesEnabled = false
//        set1.axisDependency = .left
//        let barWidth = 1.0
//        let data = BarChartData(dataSets: [set1])
//        data.barWidth = barWidth
//        return data
//
        
        
        
        
        
    }
    
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
      //  uiView.data = generateBarData()
        
        uiView.data = generateBarData()
    }
    
    
    
    
    
    
    
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView1(plotPoints: [500,800,700,300,200])
    }
}
