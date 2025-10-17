//
//  Score.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import Foundation
import NaturalLanguage

struct Score {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String) -> Double {
        var sentimentScore: Double = 0.0
        tagger.string = text
        
        tagger.enumerateTags(in: text.startIndex ..< text.endIndex, unit: .paragraph, scheme: .sentimentScore) { tag, _ in
            if let sentimentString = tag?.rawValue, let score = Double(sentimentString) {
                sentimentScore = score
                
            }
            return false
        }
        return sentimentScore
    }
}
