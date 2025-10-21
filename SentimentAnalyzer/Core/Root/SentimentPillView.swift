//
//  SentimentPillView.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 21.10.25.
//

import SwiftUI

struct SentimentPillView: View {
    let sentiment: Sentiment
    let percentage: Int
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: sentiment.icon)
                    .font(.system(size: 14, weight: .medium))
                Text(sentiment.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundStyle(sentiment.sentimentColor)
            
            Text("\(percentage)%")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(sentiment.sentimentColor.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: sentiment.gradientColors),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                )
        )
    }
}

#Preview {
    SentimentPillView(sentiment: .positive, percentage: 65)
}
