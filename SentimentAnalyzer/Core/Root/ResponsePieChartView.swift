//
//  ResponsePieChartView.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 21.10.25.
//

import SwiftUI
import Charts

struct ResponsePieChartView: View {
    let responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score }
    }
    var body: some View {
        Chart(responses) { response in
            SectorMark(
                angle: .value("Type", response.score),
                innerRadius: .ratio(0.75)
            )
            .foregroundStyle(by: .value("Sentiment", response.sentiment))
        }
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .chartForegroundStyleScale([
            Sentiment.positive: Sentiment.positive.sentimentColor,
            Sentiment.neutral: Sentiment.neutral.sentimentColor,
            Sentiment.negative: Sentiment.negative.sentimentColor
        ])
        .chartBackground { proxy in
            GeometryReader { geometry in
                if let anchor = proxy.plotFrame {
                    let frame = geometry[anchor]
                    Image(systemName: "text.bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(height: frame.height * 0.4)
                        .position(x: frame.midX, y: frame.midY)
                }
                    
            }
        }
        
    }
}

#Preview {
    ResponsePieChartView(responses: [])
}
