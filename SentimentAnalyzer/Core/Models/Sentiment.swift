//
//  Sentiment.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import Charts
import SwiftUI

enum Sentiment: String, Plottable {
    case positive = "Positive"
    case negative = "Negative"
    case neutral = "Neutral"
    
    init(_ score: Double) {
        if score > 0.25 {
            self = .positive
        } else if score < -0.25 {
            self = .negative
        } else {
            self = .neutral
        }
    }
    
    var icon: String {
        switch self {
        case .positive:
            return "hand.thumbsup.fill"
        case .negative:
            return "hand.thumbsdown.fill"
        case .neutral:
            return "line.3.horizontal.decrease.circle.fill"
        }
    }
    
    var sentimentColor: Color {
        switch self {
        case .positive:
            return .green
        case .negative:
            return .red
        case .neutral:
            return .gray
        }
    }
}
