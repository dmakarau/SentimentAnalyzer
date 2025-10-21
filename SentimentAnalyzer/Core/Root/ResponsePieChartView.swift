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
        VStack(spacing: 16) {
            if responses.isEmpty {
                emptyStateView
            } else {
                chartView
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
    
    private var chartView: some View {
        Chart(responses) { response in
            SectorMark(
                angle: .value("Count", 1),
                innerRadius: .ratio(0.6),
                angularInset: 2
            )
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: response.sentiment.gradientColors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .opacity(0.9)
        }
        .chartLegend(.hidden)
        .frame(height: 180)
        .chartBackground { proxy in
            GeometryReader { geometry in
                if let anchor = proxy.plotFrame {
                    let frame = geometry[anchor]
                    VStack(spacing: 4) {
                        Image(systemName: "brain.head.profile.fill")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundStyle(.primary)
                        Text("Sentiment")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.pie.fill")
                .font(.system(size: 40, weight: .light))
                .foregroundStyle(.secondary)
            Text("No responses yet")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Add your first response to see sentiment analysis")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(height: 180)
    }
}

#Preview {
    ResponsePieChartView(responses: [])
}
