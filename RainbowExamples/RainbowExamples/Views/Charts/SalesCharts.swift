//
//  SalesCharts.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-06-29.
//

import SwiftUI
import Charts

struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Double
}

let sampleData = [
    SalesData(month: "January", sales: 1500),
    SalesData(month: "February", sales: 2000),
    SalesData(month: "March", sales: 2500),
    SalesData(month: "April", sales: 3000),
    SalesData(month: "May", sales: 3500),
]

struct SalesChartView: View {
    var body: some View {
        VStack {
            Text("Monthly Sales Data")
                .font(.title)
                .padding()

            Chart(sampleData) { data in
                BarMark(
                    x: .value("Month", data.month),
                    y: .value("Sales", data.sales)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 300)
            .padding()
        }
    }
}
