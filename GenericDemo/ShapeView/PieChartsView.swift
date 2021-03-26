//
//  PieChartsView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 24/03/21.
//

import SwiftUI
import Charts


struct SectorCustomModel {
    var sector : String
    var fundsize : Double
    
    
}

//import Chart
struct PieChartsView1: UIViewRepresentable {
    typealias UIViewType = PieChartView
    var sectors : [SectorCustomModel]
    @Binding var sectorLabel : String
    
//    typealias UIViewType = PieChartView
//    var sectors : [SectorCustomModel]
//    @Binding var sectorLabel : String
    
    
    
    
    func makeUIView(context: Context) -> PieChartView {
        let pieChart = PieChartView()
        pieChart.chartDescription?.enabled = false
        pieChart.delegate = context.coordinator
        
        pieChart.legend.horizontalAlignment = .right
        pieChart.legend.verticalAlignment = .center
        pieChart.legend.orientation = .vertical
        pieChart.legend.xEntrySpace = 7
        pieChart.legend.yEntrySpace = 0
        pieChart.legend.yOffset = 0
        
        pieChart.drawEntryLabelsEnabled = false
        pieChart.drawHoleEnabled = false
        pieChart.entryLabelColor = UIColor.blue
        pieChart.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        pieChart.data = generatePieChart(chartView: pieChart)
        return pieChart
       
    }
    
//    func makeUIView(context: Context) -> PieChartView {
//
//
//        let pieChart  = PieChartView()
//
//        pieChart.chartDescription?.enabled = false
//        pieChart.delegate = context.coordinator
//
//        pieChart.legend.horizontalAlignment = .right
//        pieChart.legend.verticalAlignment = .center
//        pieChart.legend.orientation = .vertical
//        pieChart.legend.xEntrySpace = 7
//        pieChart.legend.yEntrySpace = 0
//        pieChart.legend.yOffset = 0
//        pieChart.drawEntryLabelsEnabled = false
//        pieChart.drawHoleEnabled = false
//        pieChart.entryLabelColor = UIColor.blue
//        pieChart.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
//        pieChart.data = generatePieChart(chartView: pieChart)
//        return pieChart
//
//
//    }

    
    
    
    
    
    
    
    
    
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
      //  uiView.data = generatePieChart(chartView: uiView)
        uiView.data = generatePieChart(chartView: uiView)
    
    
    }
    
    
    class coordinator: NSObject, ChartViewDelegate {
        
        @Binding var sectorLabel : String
        init(sectorLabel : Binding<String>) {
            _sectorLabel = sectorLabel
        }
        
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            if let e = entry as? PieChartDataEntry {
                sectorLabel = e.label ?? ""
                print(sectorLabel)
                
                
                
            }
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            sectorLabel = " "
        }
        
        
        
        
    }
    
    func makeCoordinator() ->  PieChartsView1.coordinator {
        return coordinator(sectorLabel: $sectorLabel)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func generatePieChart(chartView : PieChartView) -> PieChartData {
        
        let entries = (0..<sectors.count).map { (i) -> PieChartDataEntry in
           
            return PieChartDataEntry(value: sectors[i].fundsize, label: String(sectors[i].sector.prefix(25)))
            
           
        }
        
        
        let set = PieChartDataSet(entries: entries, label: "")
        
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        set.drawValuesEnabled = false
        set.highlightColor = UIColor.orange
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        let pFormater = NumberFormatter()
        pFormater.numberStyle = .percent
        pFormater.maximumFractionDigits = 1
        pFormater.multiplier = 1
        pFormater.percentSymbol = " %"
        
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormater))
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        return data
        
    }
    
    
    
    
    
    
    
   
}

//struct PieChartsView_Previews: PreviewProvider {
//
//    @State var selectedSector = ""
//    @State var fundsSectors = [SectorCustomModel]()
//   // @State var sectorarr: [String] = ["8","3","2","5"]
//    static var previews: some View {
//        PieChartsView1(sectors: fundsSectors, sectorLabel: $selectedSector)
//    }
//}
