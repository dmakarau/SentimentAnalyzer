//
//  ContentView.swift
//  SentimentAnalyzer
//
//  Created by Denis Makarau on 17.10.25.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var responseText = ""
    @State private var responses = [Response]()
    @State private var scorer = Scorer()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ResponsePieChartView(responses: responses)
                    
                    Text("Overview section")
                    
                    ForEach(responses) { response in
                        ResponseCellView(response: response)
                            .padding(.horizontal)
                    }
                }
                
                HStack {
                    TextField(
                        "Your thoughts...",
                        text: $responseText,
                        axis: .vertical
                    )
                    .padding(12)
                    .padding(.leading, 4)
                    .padding(.leading, 4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                    Button("Done") {
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .disabled(responseText.isEmpty)
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
        .task {
            for response in Response.mockResponses {
                saveResponse(response)
            }
        }
        
    }
}

private extension ContentView {
    func saveResponse(_ text: String, shouldInsertAtStart: Bool = false) {
        let score = scorer.score(text)
        let response = Response(
            id: UUID().uuidString,
            text: text,
            score: score
        )
        if shouldInsertAtStart {
            responses.insert(response, at: 0)
        } else {
            responses.append(response)
        }
    }
    
    func onDoneTapped() {
        guard responseText.isEmpty == false else { return }
        saveResponse(responseText, shouldInsertAtStart: true)
        responseText = ""
    }
}

#Preview {
    ContentView()
}
