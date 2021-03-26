//
//  LineChartView.swift
//  GenericDemo
//
//  Created by Knoxpo MacBook Pro on 26/03/21.
//

import SwiftUI
import Charts

struct DataPoints{
    var xVal: String
    var yVal: Double
    
    
}

struct LineChartView1: UIViewRepresentable {
    
    
    typealias UIViewType = LineChartView
    
    var plotPoints : [DataPoints]
    
    var color : String
    @Binding var tapIndex : Int
    @Binding var xpos : CGFloat
    @Binding var ypos : CGFloat
    
 
    func makeUIView(context: Context) -> LineChartView {
        let linecharts = LineChartView()
        linecharts.chartDescription?.enabled = false
        linecharts.delegate = context.coordinator
        
        linecharts.pinchZoomEnabled = false
        linecharts.doubleTapToZoomEnabled = false
        linecharts.dragEnabled = true
        
        linecharts.legend.enabled = false
        
        linecharts.xAxis.enabled = false
        linecharts.xAxis.drawGridLinesEnabled = false
        linecharts.xAxis.labelPosition = .bottom
        linecharts.xAxis.labelFont = UIFont(name: "HelveticaNeue-Medium", size: 12)!
        
        linecharts.leftAxis.enabled = false
        linecharts.leftAxis.drawGridLinesEnabled = false
        
        linecharts.rightAxis.enabled = true
        linecharts.rightAxis.drawGridLinesEnabled = true
        
        linecharts.data = generateLineData(chartView: linecharts)
        
        
        linecharts.highlightPerTapEnabled = true
        linecharts.highlightPerDragEnabled = true
        
        
        return linecharts
        
        
        
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = generateLineData(chartView: uiView)
    }
    
    
    class Coordinator: NSObject, ChartViewDelegate {
        
        @Binding var tabIndex : Int
        @Binding var xPos : CGFloat
        @Binding var yPos : CGFloat
        
        init(tapIndex : Binding<Int>, xPos : Binding<CGFloat>, yPos : Binding<CGFloat>) {
            _tabIndex = tapIndex
            _xPos = xPos
            _yPos = yPos
         
            
        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            tabIndex = Int(highlight.x)
            xPos = highlight.xPx
            yPos = highlight.yPx
            
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            tabIndex = 0
        }
        
        
        
        
        
        
        
        
        
    }
    
    func makeCoordinator() ->LineChartView1.Coordinator {
        return Coordinator(tapIndex: $tapIndex, xPos: $xpos, yPos: $ypos)
    }
    
    
    
    
    func generateLineData(chartView : LineChartView) -> LineChartData {
        
        let entries1 = (0..<plotPoints.count).map { (i) -> ChartDataEntry in
            
            return ChartDataEntry(x: Double(i), y: plotPoints[i].yVal)
         
        }
        
        let set = LineChartDataSet(entries: entries1, label: "Line Data Set")
        set.setColor(UIColor.red)
        set.lineWidth = 2.0
        set.setCircleColor(UIColor.orange)
        set.circleRadius = 0
        set.circleHoleRadius = 2.5
        let gardientColors = [ChartColorTemplates.colorFromString(color == "red" ? "#ffe700ff" : "#40F73757").cgColor,
                              ChartColorTemplates.colorFromString(color == "orange" ? "#ffe700ff" : "#40F73757").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gardientColors as CFArray, locations: nil)!
        set.fillAlpha = 0.9
        set.fillColor = UIColor(named: color)!
      //  set.fill = Fill(linearGradient: gradient, angle: 270)
        
        set.fill = Fill(linearGradient: gradient, angle: 270)
        set.mode = .cubicBezier
        set.drawValuesEnabled = false
        set.highlightColor = UIColor.orange
        set.highlightLineWidth = 1.5
        set.highlightLineDashLengths = [3,3]
        
        
        set.fillFormatter = DefaultFillFormatter { _,_ -> CGFloat in
            return CGFloat(chartView.leftAxis.axisMinimum)
           
        }
        set.axisDependency = .left
        set.drawFilledEnabled = true
        
        return LineChartData(dataSet: set)
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    
    
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
       // LineChartView1(plotPoints: , color: "red", tapIndex: .constant(Int(0.1)), xpos: .constant(2.0), ypos: .constant(2.0))
        
        
        LineChartView1(plotPoints: [DataPoints(xVal: "x", yVal: 120),
                                    DataPoints(xVal: "y", yVal: 180)], color: "red", tapIndex: .constant(0), xpos: .constant(0.0), ypos: .constant(0.0))
        
        
        
        
        
    }
}
