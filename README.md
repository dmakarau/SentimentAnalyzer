# 🧠 Sentiment Analyzer

A modern iOS app that analyzes the emotional sentiment of text responses in real-time, providing beautiful visualizations and insights into your thoughts and feelings.

## 📱 Features

- **Real-time Sentiment Analysis**: Instantly analyze the emotional tone of your text inputs
- **Beautiful Visualizations**: Interactive pie charts showing sentiment distribution
- **Modern UI Design**: Clean, professional interface with gradients and blur effects
- **Sentiment Breakdown**: Detailed percentage breakdown of positive, negative, and neutral sentiments
- **Response History**: Keep track of all your analyzed responses
- **Smart Scoring**: Advanced scoring system that categorizes sentiment with precision

## 🎨 Design Highlights

- **Modern iOS Design**: Utilizes `.ultraThinMaterial` blur effects and contemporary styling
- **Custom Color Palette**: Professional emerald green, coral red, and blue-gray color scheme
- **Gradient Elements**: Subtle gradients throughout the interface for depth and visual appeal
- **Responsive Layout**: Optimized for various iOS device sizes
- **Intuitive Icons**: Clear SF Symbols for easy recognition and accessibility

## 🛠 Technical Implementation

### Architecture
- **SwiftUI**: Built entirely with SwiftUI for modern iOS development
- **MVVM Pattern**: Clean separation of concerns with observable state management
- **Charts Framework**: Utilizes iOS 16+ Charts framework for data visualization

### Key Components
- `Sentiment` - Core model with scoring logic and visual properties
- `Response` - Data model for analyzed text responses
- `Scorer` - Sentiment analysis engine
- `ResponsePieChartView` - Interactive chart visualization
- `TotalSentimentSectionView` - Overall sentiment breakdown
- `ResponseCellView` - Individual response display

### Sentiment Analysis
The app uses a custom scoring algorithm that:
- Analyzes text input for emotional indicators
- Scores responses on a scale from -1 (negative) to +1 (positive)
- Categorizes into three sentiment types:
  - **Positive** (score > 0.25)
  - **Negative** (score < -0.25)
  - **Neutral** (-0.25 to 0.25)

## 📋 Requirements

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/dmakarau/SentimentAnalyzer.git
   cd SentimentAnalyzer
   ```

2. **Open in Xcode**
   ```bash
   open SentimentAnalyzer.xcodeproj
   ```

3. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

## 📸 Screenshots

<div align="center">

### Main Dashboard
<img src="https://github.com/dmakarau/SentimentAnalyzer/assets/screenshots/main-dashboard.png" width="300" alt="Main Dashboard with Pie Chart">

*Interactive pie chart showing sentiment distribution with modern gradient design*

### Sentiment Analysis & Response List
<img src="https://github.com/dmakarau/SentimentAnalyzer/assets/screenshots/sentiment-breakdown.png" width="300" alt="Sentiment Breakdown and Response List">

*Detailed sentiment breakdown with percentage pills and individual response analysis*

</div>

### Key Features Shown:
- 🎨 **Modern "Vibe Check" branding** with custom ECG icon
- 📊 **Interactive pie chart** with gradient colors and brain icon center
- 📈 **Sentiment breakdown** showing percentage distribution (Positive, Negative, Neutral)
- 💬 **Response cards** with individual sentiment indicators and scores
- 🎯 **Clean, professional UI** with blur effects and consistent spacing
- 🌈 **Color-coded sentiment** system for easy visual recognition

## 🎯 Usage

1. **Add Response**: Type your thoughts in the text field at the bottom
2. **Analyze**: Tap the send button to analyze sentiment
3. **View Results**: See your sentiment breakdown in the pie chart
4. **Track Progress**: Monitor overall sentiment trends over time

## 🧪 Sample Data

The app includes sample responses covering various sentiment scenarios:
- AI and technology opinions
- Workplace thoughts
- General life perspectives

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Denis Makarau**
- GitHub: [@dmakarau](https://github.com/dmakarau)

## 🙏 Acknowledgments

- Apple's SwiftUI and Charts frameworks
- SF Symbols for beautiful iconography
- The iOS development community for inspiration

---

*Built with ❤️ using SwiftUI*