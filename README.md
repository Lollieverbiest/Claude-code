# Decision Lean

**Make fewer wrong decisions — without guilt or rules.**

*"The goal isn't perfect rationality — just fewer wrong decisions."*
— Inspired by Daniel Kahneman

---

## What Is This?

Decision Lean is a privacy-first iOS app that helps you reflect on personal decisions before acting, grounded in behavioral economics.

Whether you're about to buy something, commit your time, invest money, or say yes to an experience — the app guides you through a short reflection that surfaces cognitive biases without shame or moralization.

**No scores. No advice. No judgment.**
Just clearer thinking, one decision at a time.

---

## How It Works

1. **Choose your decision category**
   - Purchases
   - Investments
   - Time & Energy
   - Experiences

2. **Answer 5 quick questions** (60-90 seconds)
   - Randomly assigned A/B flow for each category
   - Minimal typing, mostly multiple choice

3. **Get your Decision Lean**
   - Neutral summary of your thinking
   - Dominant cognitive friction identified
   - **Decision Lean:** Direction without prescription
   - **Confidence Band:** Honest about uncertainty
   - Soft next step suggestion

---

## What Makes It Different

### Grounded in Behavioral Economics

Every question targets specific cognitive biases:
- **Present Bias** — Overweighting immediate rewards
- **Loss Aversion** — Fear of losing what we have
- **Opportunity Cost Neglect** — Ignoring alternatives
- **Projection Bias** — Overestimating future preferences
- **Affect Heuristic** — Emotion-driven decisions
- **Planning Fallacy** — Underestimating time/effort
- **Sunk Cost Thinking** — Continuing because of past investment
- **Social Proof** — Decisions driven by others

### Non-Judgmental by Design

We never:
- Tell you what to do
- Label decisions as good or bad
- Assign scores or ratings
- Moralize your choices
- Create guilt or pressure

We always:
- Use calm, intelligent language
- Provide direction, not prescription
- Acknowledge complexity
- Respect your autonomy
- Preserve your complete privacy

### Privacy-First Architecture

- All data stored locally on your device
- No tracking or analytics
- No account required
- No internet connection needed
- You control all data deletion

---

## The 5-Block Output Structure

Every Decision Lean includes:

### 1. Neutral Summary
Factual rephrasing of your answers without interpretation.

### 2. Dominant Friction
One primary cognitive tension surfaced (not multiple).

### 3. Decision Lean ★
**The core feature:** Directional guidance without instruction.

Examples:
- "This decision currently leans toward waiting"
- "This decision currently leans toward acting now"
- "This decision currently leans toward renegotiating scope"

### 4. Confidence Band
Honest acknowledgment of uncertainty:
- 📊 Low confidence — revisit later
- 📊 Medium confidence — pause recommended
- 📊 High confidence — internally consistent

### 5. Soft Next Step
A gentle, non-directive suggestion for what to consider next.

---

## Categories & Flows

### 🛒 Purchases
Consumer goods, subscriptions, gadgets

**Flow A:** Reflection-First (introspective)
**Flow B:** Trade-off-First (economic framing)

**Lean Options:**
- Lean toward acting now
- Lean toward waiting
- Lean toward reframing the purchase

---

### 📈 Investments
Financial decisions

**Flow A:** Confidence Stress-Test
**Flow B:** Downside Framing

**Lean Options:**
- Lean toward caution
- Lean toward smaller exposure
- Lean toward acting deliberately

---

### ⏰ Time & Energy
Commitments and obligations

**Flow A:** Capacity Realism
**Flow B:** Exit-Cost Awareness

**Lean Options:**
- Lean toward saying no
- Lean toward renegotiating scope
- Lean toward committing deliberately

---

### ✨ Experiences
Travel, events, adventures

**Flow A:** Memory Realism
**Flow B:** Social-Pressure Removal

**Lean Options:**
- Lean toward acting now
- Lean toward simplifying
- Lean toward letting it pass

---

## Tech Stack

**Platform:** iOS 17.0+
**Language:** Swift 5.9+
**Framework:** SwiftUI
**Architecture:** MVVM
**Storage:** Local JSON (prepared for Core Data)
**Dependencies:** None (vanilla SwiftUI)

### Why No Dependencies?

- No version conflicts
- No security vulnerabilities
- No licensing issues
- Faster compilation
- Easier App Store review
- Full control over codebase

---

## Project Structure

```
DecisionLean/
├── App/
│   └── DecisionLeanApp.swift                 # Entry point
├── Models/
│   ├── DecisionCategory.swift                # 4 categories
│   ├── Question.swift                        # Q&A types
│   ├── DecisionFlow.swift                    # Flows & sessions
│   └── ReflectionOutput.swift                # 5-block structure
├── ViewModels/
│   ├── DecisionFlowViewModel.swift           # State management
│   ├── ReflectionGenerator.swift             # Decision Lean logic
│   └── FlowDefinitions.swift                 # 8 flows (4×2)
├── Views/
│   ├── HomeView.swift                        # Navigation root
│   ├── CategorySelectionView.swift           # Category picker
│   ├── QuestionFlowView.swift                # Question display
│   ├── ReflectionView.swift                  # 5-block output
│   └── Components/                           # Reusable UI
└── Services/
    └── PersistenceService.swift              # Local storage
```

---

## Getting Started

### Requirements
- macOS 14.0+ (Sonoma)
- Xcode 15.0+
- iOS 17.0+ deployment target
- Apple Developer account (for device testing & App Store)

### Quick Start

1. Open Xcode 15+
2. Create new iOS App project named "DecisionLean"
3. Copy all Swift files from this repository
4. Configure signing with your Apple Developer team
5. Build and run (⌘R)

### Full Setup Instructions

See **[DELIVERABLES_FULL.md](DELIVERABLES_FULL.md)** for:
- Complete question sets for all categories
- Example outputs with Decision Lean
- App Store listing copy
- Tech stack details
- UI/UX tone guidance
- Step-by-step deployment guide

---

## Documentation

| Document | Description |
|----------|-------------|
| **[DELIVERABLES_FULL.md](DELIVERABLES_FULL.md)** | Complete product spec with all flows, examples, and guidance |
| **[LICENSE](LICENSE)** | MIT License |

---

## Philosophy & Design Principles

### What We Never Do
- Give direct advice
- Tell users what they "should" do
- Label decisions as good or bad
- Assign scores, ratings, or warnings
- Replace professional judgment

### What We Always Do
- Use calm, intelligent language
- Provide direction without prescription
- Acknowledge complexity and uncertainty
- Respect user autonomy
- Preserve complete privacy

### Legal & Ethical

**Global Disclaimer:**
> This app does not provide financial, medical, legal, or safety advice. It supports personal reflection only. All decisions remain your own.

**Category-Specific Disclaimers:**
- Purchases/Investments: "This reflection is not financial advice."
- Time & Energy: "This reflection does not account for external obligations."
- Experiences: "This reflection does not assess physical safety or risk."

---

## Roadmap

### v1.0 (Current) ✅
- All 4 categories fully implemented
- 8 flows (2 per category)
- 5-block Decision Lean output
- Complete privacy protection
- Local persistence

### v1.1 (Future)
- Decision history view
- Pattern insights (privacy-preserving)
- Optional reminders (local only)
- Export functionality (JSON)

### v1.2 (Future)
- iPad optimization
- Widget support
- Enhanced personalization
- Additional categories

---

## App Store Submission

### App Name
Decision Lean

### Subtitle
Make fewer wrong decisions — without guilt or rules.

### Category
Primary: Productivity
Secondary: Lifestyle

### Keywords
decision making, behavioral economics, reflection, mindfulness, thinking, cognitive bias, purchases, time management, clarity

### Privacy
- No data collection
- No tracking
- No analytics
- All data local
- PrivacyInfo.xcprivacy included

---

## License

MIT License — See [LICENSE](LICENSE) for details.

---

## Acknowledgments

Inspired by research from:
- Daniel Kahneman (*Thinking, Fast and Slow*)
- Dan Ariely (*Predictably Irrational*)
- Richard Thaler (*Nudge*, *Misbehaving*)

And the broader behavioral economics community.

---

**The goal isn't perfect rationality — just fewer wrong decisions.**

Build this as a product you would personally trust and use.
