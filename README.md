# Decision Reflection App

**"The goal isn't perfect rationality — just fewer wrong decisions."**
*Inspired by Daniel Kahneman*

A privacy-first iOS app that helps users reflect on personal decisions before acting, grounded in behavioral economics principles.

## Product Philosophy

This app reduces cognitive bias without shaming users. It never:
- Tells users what to do
- Labels decisions as good or bad
- Scores or ranks decisions
- Moralizes spending or behavior

## Features

### Decision Categories (v1)
- **Purchases** — Consumer goods, subscriptions, gadgets
- **Investments** — Financial decisions
- **Time & Energy** — Commitments and obligations
- **Experiences** — Travel, events, memories

### Two Alternative Flows (A/B Testing)
Each category includes two scientifically-designed question flows:
- **Flow A: Reflection-First** — Introspective framing
- **Flow B: Trade-off-First** — Decision economics framing

Both flows guide users through 5 questions that surface:
- Loss aversion
- Present bias
- Opportunity cost awareness
- Affect heuristic
- Projection bias

## Design Principles

- **Private** — Local storage by default, no tracking
- **Calm** — Minimalist UI, no gamification
- **Intelligent** — Grounded in behavioral science
- **Non-judgmental** — Neutral, emotionally safe language
- **Low-friction** — ≤ 90 seconds per decision

## Tech Stack

- **Language:** Swift 5.9+
- **Framework:** SwiftUI
- **Architecture:** MVVM with clean separation
- **Storage:** Local JSON persistence (prepared for Core Data)
- **Platform:** iOS 17.0+
- **Dependencies:** None (vanilla SwiftUI)

## Project Structure

```
DecisionReflection/
├── App/
│   └── DecisionReflectionApp.swift
├── Models/
│   ├── DecisionCategory.swift
│   ├── Question.swift
│   ├── DecisionFlow.swift
│   └── ReflectionOutput.swift
├── ViewModels/
│   ├── DecisionFlowViewModel.swift
│   └── ReflectionGenerator.swift
├── Views/
│   ├── HomeView.swift
│   ├── CategorySelectionView.swift
│   ├── QuestionView.swift
│   ├── ReflectionView.swift
│   └── Components/
├── Services/
│   └── PersistenceService.swift
└── Resources/
    └── FlowDefinitions.json
```

## Getting Started

### Requirements
- Xcode 15.0+
- iOS 17.0+ deployment target
- Swift 5.9+

### Installation
1. Open `DecisionReflection.xcodeproj` in Xcode
2. Select your development team in Signing & Capabilities
3. Build and run on simulator or device

### Running the App
1. Select a decision category
2. Answer 5 quick questions
3. Review your reflection
4. No data leaves your device

## Future Roadmap

- Decision history view (private, local)
- Optional reminder system
- Pattern insights without judgment
- Additional decision categories
- iPad optimization
- Widgets for quick access

## Privacy Commitment

- All data stored locally on device
- No analytics or tracking
- No account required
- No internet connection needed
- User controls all data deletion

## License

MIT License - See LICENSE file for details

## Contributing

This project welcomes contributions that align with the core philosophy of non-judgmental decision support.
