//
//  Response.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import Foundation

struct Response: Identifiable {
    let id: String
    let text: String
    let score: Double
    
    var sentiment: Sentiment {
        Sentiment(score)
    }
    
    static let mockResponses: [String] = [
        "AI will definitely automate a lot of coding tasks, but developers will always be needed to guide and supervise it.",
        "Honestly, I think AI will replace many junior developer jobs within a few years.",
        "AI is just another tool. Like Git or Stack Overflow — it helps, but doesn’t replace creativity.",
        "The future of AI in software development is exciting! We’ll be able to build apps much faster and smarter.",
        "I’m worried that companies will use AI to cut costs and fire human developers.",
        "AI can’t fully understand user needs or business logic, so human developers are safe for now.",
        "The pace of AI innovation is terrifying — it’s only a matter of time before most coding is automated.",
        "Developers who learn to use AI will become far more productive than those who don’t.",
        "I don’t think AI will take jobs, but it will definitely change how we work.",
        "AI is overhyped. I’ve tried those coding assistants and they still make tons of mistakes.",
        "This is the best era to be a developer — AI will remove boring parts of coding!",
        "I feel neutral about it. We’ve seen automation before and the industry always adapts.",
        "Some tasks like bug fixing and testing will be automated, but architecture and design will stay human-driven.",
        "It’s sad but true — a lot of entry-level positions might disappear because of AI.",
        "AI won’t take developer jobs; it will *create* new roles we can’t even imagine yet."
    ]

    
}
