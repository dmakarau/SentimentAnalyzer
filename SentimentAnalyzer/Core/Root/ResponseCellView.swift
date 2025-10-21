//
//  ResponseCellView.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import SwiftUI

struct ResponseCellView: View {
    let response: Response
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(response.text)
                    .font(.body)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 4) {
                    Text("Score:")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Text(String(format: "%.2f", response.score))
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(response.sentiment.sentimentColor)
                }
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: response.sentiment.gradientColors),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: response.sentiment.icon)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.white)
                }
                
                Text(response.sentiment.rawValue)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundStyle(response.sentiment.sentimentColor)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 1)
        )
    }
}

#Preview {
    ResponseCellView(
        response: Response(
            id: UUID().uuidString,
            text: Response.mockResponses.first!,
            score: 0.8
        )
    )
}
