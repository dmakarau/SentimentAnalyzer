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
        HStack {
            Text(response.text)
            Spacer()
            
            Image(systemName: response.sentiment.icon)
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(response.sentiment.sentimentColor)
                }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
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
