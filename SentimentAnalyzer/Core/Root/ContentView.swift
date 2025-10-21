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
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(.systemBackground),
                        Color(.systemGroupedBackground)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Custom Header
                    customHeader
                    
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ResponsePieChartView(responses: responses)
                            
                            TotalSentimentSectionView(responses: responses)
                            
                            if !responses.isEmpty {
                                responsesSection
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 100) // Space for input area
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    inputSection
                }
            }
            .navigationBarHidden(true)
        }
        .task {
            for response in Response.mockResponses {
                saveResponse(response)
            }
        }
    }
    
    private var customHeader: some View {
        HStack {
            Spacer()
            
            HStack(spacing: 8) {
                // Custom Vibe Check Icon
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.4, green: 0.6, blue: 1.0),
                                    Color(red: 0.6, green: 0.4, blue: 1.0)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 28, height: 28)
                    
                    Image(systemName: "waveform.path.ecg")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white)
                }
                
                Text("Vibe Check")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
            }
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.bottom, 12)
        .background(.ultraThinMaterial)
    }
    
    private var responsesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
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
                    Text("Recent Responses")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            
            ForEach(responses) { response in
                ResponseCellView(response: response)
                    .padding(.horizontal, 20)
            }
        }
    }
    
    private var inputSection: some View {
        VStack(spacing: 12) {
            // Subtle divider
            Rectangle()
                .fill(.quaternary)
                .frame(height: 0.5)
            
            HStack(spacing: 12) {
                TextField(
                    "Share your thoughts...",
                    text: $responseText,
                    axis: .vertical
                )
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.ultraThinMaterial)
                        .stroke(.quaternary, lineWidth: 1)
                )
                .lineLimit(1...4)
                
                Button(action: onDoneTapped) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(
                            Circle()
                                .fill(
                                    responseText.isEmpty ? 
                                    LinearGradient(
                                        gradient: Gradient(colors: [.gray, .gray.opacity(0.8)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ) : 
                                    LinearGradient(
                                        gradient: Gradient(colors: [.blue, .purple]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                }
                .disabled(responseText.isEmpty)
                .animation(.easeInOut(duration: 0.2), value: responseText.isEmpty)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
        .background(
            .ultraThinMaterial,
            in: Rectangle()
        )
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
