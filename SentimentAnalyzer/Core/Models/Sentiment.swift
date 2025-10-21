//
//  Sentiment.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import Charts
import SwiftUI

enum Sentiment: String, Plottable, CaseIterable, Identifiable {
    case positive = "Positive"
    case negative = "Negative"
    case neutral = "Neutral"
    
    var id: String { rawValue }
        
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
            return "heart.fill"
        case .negative:
            return "xmark.circle.fill"
        case .neutral:
            return "minus.circle.fill"
        }
    }
    
    var sentimentColor: Color {
        switch self {
        case .positive:
            return Color(red: 0.2, green: 0.7, blue: 0.3) // Modern emerald green
        case .negative:
            return Color(red: 0.9, green: 0.3, blue: 0.3) // Modern coral red
        case .neutral:
            return Color(red: 0.5, green: 0.5, blue: 0.6) // Modern blue-gray
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .positive:
            return [Color(red: 0.2, green: 0.7, blue: 0.3), Color(red: 0.3, green: 0.8, blue: 0.4)]
        case .negative:
            return [Color(red: 0.9, green: 0.3, blue: 0.3), Color(red: 1.0, green: 0.4, blue: 0.4)]
        case .neutral:
            return [Color(red: 0.5, green: 0.5, blue: 0.6), Color(red: 0.6, green: 0.6, blue: 0.7)]
        }
    }
}
