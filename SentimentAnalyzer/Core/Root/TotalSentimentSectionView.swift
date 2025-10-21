//
//  TotalSentimentSectionView.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 21.10.25.
//

import SwiftUI

struct TotalSentimentSectionView: View {
    let responses: [Response]
    
    var sentimentLabel: String {
        switch totalSentiment {
        case .positive:
            return "Mostly Positive"
        case .negative:
            return "Mostly Negative"
        case .neutral:
            return "Balanced"
        case .none:
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            headerView
            
            if responses.isEmpty {
                emptyStateView
            } else {
                sentimentBreakdownView
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
    
    private var headerView: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.5, green: 0.5, blue: 0.6),
                                Color(red: 0.4, green: 0.4, blue: 0.5)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                Text("Overall Sentiment")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            Spacer()
            if !responses.isEmpty {
                Text("\(responses.count) responses")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.quaternary, in: Capsule())
            }
        }
    }
    
    private var sentimentBreakdownView: some View {
        VStack(spacing: 12) {
            if let totalSentiment {
                HStack {
                    Image(systemName: totalSentiment.icon)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(totalSentiment.sentimentColor)
                    Text(sentimentLabel)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(totalSentiment.sentimentColor)
                    Spacer()
                }
                .padding(.bottom, 4)
            }
            
            HStack(spacing: 12) {
                ForEach(Sentiment.allCases) { sentiment in
                    SentimentPillView(sentiment: sentiment, percentage: percentage(for: sentiment))
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 8) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 32, weight: .light))
                .foregroundStyle(.secondary)
            Text("Start analyzing")
                .font(.subheadline)
                .fontWeight(.medium)
            Text("Add responses to see sentiment breakdown")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 20)
    }
}

private extension TotalSentimentSectionView {
    var totalSentiment: Sentiment? {
        guard responses.count > 0 else { return nil }
        return sentimentMap.max { $0.value < $1.value }?.key
    }
    
    func percentage(for sentiment: Sentiment) -> Int {
        guard !responses.isEmpty else { return 0 }
        let count = sentimentMap[sentiment, default:0]
        return Int(round((Double(count) / Double(responses.count)) * 100))
        
    }
    
    var sentimentMap: [Sentiment: Int] {
        Dictionary(grouping: responses, by: \.sentiment).mapValues(\.count)
        
    }
    
}
    
    
    #Preview {
        TotalSentimentSectionView(responses: [
            .init(id: UUID().uuidString, text: "test response1", score: 0.5),
            .init(id: UUID().uuidString, text: "test response2", score: 0.5),
            .init(id: UUID().uuidString, text: "test response3", score: -0.3),
            .init(id: UUID().uuidString, text: "test response4", score: 0.1)
            
            
        ])
    
}
