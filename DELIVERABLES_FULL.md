# Decision Lean — Complete Deliverables

**"Make fewer wrong decisions — without guilt or rules."**

---

## Table of Contents

1. [High-Level App Screen Flow](#1-high-level-app-screen-flow)
2. [Full A/B Question Sets](#2-full-ab-question-sets-all-categories)
3. [Example Outputs](#3-example-outputs-with-decision-lean--confidence-band)
4. [Suggested Tech Stack](#4-suggested-tech-stack-for-app-store-deployment)
5. [UI/UX Tone Guidance](#5-uiux-tone-guidance)
6. [App Store Listing Copy](#6-app-store-listing-copy)
7. [Technical Implementation](#7-technical-implementation-summary)

---

## 1. High-Level App Screen Flow

```
┌─────────────────────────────────────────────────────┐
│  LAUNCH APP                                         │
│  "Decision Lean"                                    │
│                                                     │
│  Subtitle: Make fewer wrong decisions — without    │
│           guilt or rules                            │
│                                                     │
│  Tagline: The goal isn't perfect rationality —     │
│          just fewer wrong decisions                 │
│                                                     │
│  [Global Disclaimer]                                │
│                                                     │
│  SELECT CATEGORY:                                   │
│  ┌──────────────────────────────────┐              │
│  │ 🛒 Purchases                     │              │
│  │ Consumer goods, subscriptions... │              │
│  └──────────────────────────────────┘              │
│  ┌──────────────────────────────────┐              │
│  │ 📈 Investments                   │              │
│  │ Financial decisions              │              │
│  └──────────────────────────────────┘              │
│  ┌──────────────────────────────────┐              │
│  │ ⏰ Time & Energy                 │              │
│  │ Commitments and obligations      │              │
│  └──────────────────────────────────┘              │
│  ┌──────────────────────────────────┐              │
│  │ ✨ Experiences                   │              │
│  │ Travel, events, adventures       │              │
│  └──────────────────────────────────┘              │
└──────────────────┬──────────────────────────────────┘
                   │
                   ↓ [User selects category]
                   │
┌──────────────────┴──────────────────────────────────┐
│  RANDOM A/B FLOW ASSIGNMENT                         │
│  (50% Flow A, 50% Flow B)                           │
└──────────────────┬──────────────────────────────────┘
                   │
                   ↓
┌─────────────────────────────────────────────────────┐
│  QUESTION 1 OF 5                                    │
│  ━━━━━━━━━━                                         │
│                                                     │
│  [Question Text]                                    │
│  [Free text input OR Multiple choice buttons]      │
│                                                     │
│  [Continue →]                                       │
└──────────────────┬──────────────────────────────────┘
                   │
                   ↓
┌─────────────────────────────────────────────────────┐
│  QUESTION 2 OF 5                                    │
│  ━━━━━━━━━━━━━━━━━━━━                              │
│                                                     │
│  [Question Text]                                    │
│  [Selection Options]                                │
│                                                     │
│  [← Back]  [Continue →]                            │
└──────────────────┬──────────────────────────────────┘
                   │
                   ↓
              [Questions 3-5...]
                   │
                   ↓
┌─────────────────────────────────────────────────────┐
│  YOUR DECISION LEAN                                 │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ SUMMARY                                       │ │
│  │ You're considering...                         │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ ⚠ DOMINANT FRICTION                           │ │
│  │ Short-term urgency appears stronger...        │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ ➡ DECISION LEAN (KEY USP)                     │ │
│  │ This decision currently leans toward:         │ │
│  │ Lean toward waiting                           │ │
│  │ [Explanation]                                 │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ CONFIDENCE                                    │ │
│  │ 📊 Medium confidence — pause recommended      │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ NEXT STEP                                     │ │
│  │ The option is still there. Seeing how...     │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  [Category-specific disclaimer]                    │
│                                                     │
│  [Reflect on Another Decision]                     │
└─────────────────────────────────────────────────────┘
                   │
                   ↓
              [Reset to Start]
```

**User Journey Time:** 60-90 seconds per decision

---

## 2. Full A/B Question Sets (All Categories)

### 🛒 PURCHASES

#### Flow A: Reflection-First

**Q1:** What are you considering buying?
- Type: Free text
- Placeholder: "e.g., noise-canceling headphones"

**Q2:** Why does this feel like the right moment?
- I've been thinking about it for a while
- It's on sale or feels limited
- I'm reacting to how I feel right now
- I don't really know

**Q3:** If you buy this, what are you not choosing?
- Saving the money
- Another purchase
- Less clutter or mental space
- Something else

**Q4:** Imagine yourself 30 days from now. What feels most likely?
- I'm glad I bought it
- I feel neutral about it
- I barely used it
- I slightly regret it

**Q5:** If this disappeared tomorrow, what would you most likely do?
- Buy an alternative
- Do nothing and move on
- Revisit it later
- I'm not sure

#### Flow B: Trade-off-First

**Q1:** What are you thinking of buying?
- Type: Free text
- Placeholder: "e.g., smart watch"

**Q2:** How does the cost compare to what you'd normally spend on this type of thing?
- Much less than usual
- About typical
- More than usual
- Much more than usual

**Q3:** What else could this money become?
- Saved for something specific
- Added to general savings
- Spent on a different priority
- Haven't thought about it

**Q4:** How often do you expect to use this in the next month?
- Daily or almost daily
- A few times a week
- Occasionally
- Rarely or never

**Q5:** What would happen if you waited a week?
- The opportunity would be gone
- The price might change
- My interest might fade
- Nothing would change

---

### 📈 INVESTMENTS

#### Flow A: Confidence Stress-Test

**Q1:** What financial decision are you considering?
- Type: Free text
- Placeholder: "e.g., buying cryptocurrency, changing funds"

**Q2:** How would you describe your understanding of this?
- I've researched this thoroughly
- I understand the basics
- I'm relying on someone else's advice
- I'm not entirely sure

**Q3:** What happens if you're wrong about this?
- I'd lose money I can afford to lose
- I'd regret it but recover
- It would meaningfully set me back
- I haven't thought about it

**Q4:** What's driving the timing of this?
- I've been planning this for a while
- Recent market movement
- Someone recommended it now
- I feel like I'm missing out

**Q5:** If this goes poorly, what would you think?
- That's part of the risk
- I'd feel frustrated but move on
- I'd blame myself
- I'm not sure

#### Flow B: Downside Framing

**Q1:** What are you thinking of doing with your money?
- Type: Free text
- Placeholder: "e.g., invest in index funds, buy stock"

**Q2:** How much of your available money would this represent?
- A small percentage
- A meaningful portion
- Most of it
- More than I currently have

**Q3:** Which would feel worse?
- Acting now and losing
- Not acting and missing gains
- About the same
- Hard to say

**Q4:** What's the worst realistic outcome here?
- I lose a small amount
- I lose a significant amount
- I lose most or all of it
- I'm not certain

**Q5:** Could you wait a month to decide?
- Yes, and it wouldn't matter
- Yes, but I'd feel anxious
- No, the window closes soon
- I'm not sure

---

### ⏰ TIME & ENERGY

#### Flow A: Capacity Realism

**Q1:** What commitment are you considering?
- Type: Free text
- Placeholder: "e.g., joining a board, volunteering weekly"

**Q2:** How much time would this realistically take per week?
- 1-2 hours
- 3-5 hours
- 6-10 hours
- I'm not entirely sure

**Q3:** When you think about your current week, how does it feel?
- I have room for more
- I'm at capacity but managing
- I'm already stretched
- I'm overwhelmed

**Q4:** What would you stop doing to make room for this?
- Something specific I'd gladly drop
- Rest or downtime
- Something important I'd have to cut
- I haven't thought about it

**Q5:** How easy would it be to exit this later if needed?
- Very easy, low stakes
- Possible but awkward
- Difficult or complicated
- I'm not sure

#### Flow B: Exit-Cost Awareness

**Q1:** What are you thinking of saying yes to?
- Type: Free text
- Placeholder: "e.g., coaching a team, taking on a project"

**Q2:** What's the expected duration of this?
- A few weeks or less
- A few months
- Six months to a year
- Indefinite or unclear

**Q3:** If you needed to step back in a month, what would happen?
- No problem, easy to exit
- Awkward but manageable
- It would let people down
- I'd be locked in

**Q4:** Why are you considering this now?
- It aligns with what I want
- Someone asked and I want to help
- I feel like I should
- I'm not entirely sure

**Q5:** Six months from now, how would you feel about this?
- Glad I committed
- It would feel neutral
- I'd wish I'd said no
- Hard to predict

---

### ✨ EXPERIENCES

#### Flow A: Memory Realism

**Q1:** What experience are you considering?
- Type: Free text
- Placeholder: "e.g., concert tickets, weekend trip"

**Q2:** What's making this feel appealing right now?
- I've wanted to do this for a while
- It's time-limited or exclusive
- Others are going
- It just sounds fun

**Q3:** A year from now, how much do you think you'd remember this?
- Vividly and often
- Occasionally with fondness
- Barely or not at all
- Hard to say

**Q4:** What would you be giving up to do this?
- Money I'd otherwise save
- Time I'd spend on something else
- Rest or recovery
- I haven't thought about it

**Q5:** If this weren't available, what would you feel?
- Genuinely disappointed
- A little bummed but fine
- Mostly relieved
- I'm not sure

#### Flow B: Social-Pressure Removal

**Q1:** What are you thinking of doing?
- Type: Free text
- Placeholder: "e.g., destination wedding, festival"

**Q2:** If no one else knew about your decision, what would you do?
- Still definitely go
- Probably still go
- Probably skip it
- I'm not sure

**Q3:** How much does the social element matter?
- It's the whole point
- It adds a lot of value
- It's secondary
- Not much at all

**Q4:** What's the total cost — money, time, and energy?
- Low, easy to absorb
- Moderate but manageable
- High but possibly worth it
- Genuinely stretching

**Q5:** Could you do a simpler version of this?
- Yes, and I'd prefer that
- Yes, but it wouldn't be the same
- Not really
- I haven't considered it

---

## 3. Example Outputs (with Decision Lean + Confidence Band)

### Example 1: Purchases — Impulse Buy (Flow A)

**User Input:**
- Item: "Designer sneakers"
- Timing: "It's on sale or feels limited"
- Trade-off: "Another purchase"
- Future: "I barely used it"
- If gone: "Do nothing and move on"

**OUTPUT:**

#### Summary
You're considering designer sneakers, mainly driven by timing and current availability.

#### ⚠ Dominant Friction
Short-term urgency appears stronger than long-term value.

#### ➡ Decision Lean
**This decision currently leans toward:** Lean toward waiting

Your own signals suggest low future value and minimal loss if you pass.

#### Confidence
📊 **High confidence — internally consistent**

#### Next Step
The option is still there. Seeing how you feel about it tomorrow can be clarifying.

**Disclaimer:** This reflection is not financial advice. This app supports personal reflection only. All decisions remain your own.

---

### Example 2: Investments — FOMO-Driven (Flow A)

**User Input:**
- Decision: "Buying cryptocurrency"
- Understanding: "I'm relying on someone else's advice"
- Downside: "It would meaningfully set me back"
- Timing: "I feel like I'm missing out"
- If goes poorly: "I'd blame myself"

**OUTPUT:**

#### Summary
You're considering buying cryptocurrency, primarily based on someone else's recommendation.

#### ⚠ Dominant Friction
Overconfidence — acting without full understanding of the risks.

#### ➡ Decision Lean
**This decision currently leans toward:** Lean toward caution

The combination of uncertainty and meaningful downside suggests slowing down.

#### Confidence
📊 **Low confidence — revisit later**

#### Next Step
Waiting until you can articulate the risks clearly may prevent regrettable outcomes.

**Disclaimer:** This reflection is not financial advice. This app supports personal reflection only. All decisions remain your own.

---

### Example 3: Time & Energy — Overcommitment (Flow A)

**User Input:**
- Commitment: "Joining a nonprofit board"
- Time: "6-10 hours" per week
- Capacity: "I'm already stretched"
- Replacement: "Rest or downtime"
- Exit: "Difficult or complicated"

**OUTPUT:**

#### Summary
You're considering joining a nonprofit board, which would require substantial weekly time.

#### ⚠ Dominant Friction
Planning fallacy — adding more when already at capacity.

#### ➡ Decision Lean
**This decision currently leans toward:** Lean toward saying no

You're already stretched and this would be difficult to exit if it becomes too much.

#### Confidence
📊 **High confidence — internally consistent**

#### Next Step
Saying no now preserves your capacity for things that might matter more later.

**Disclaimer:** This reflection does not account for external obligations. This app supports personal reflection only. All decisions remain your own.

---

### Example 4: Experiences — Social Pressure (Flow B)

**User Input:**
- Experience: "Destination wedding"
- If alone: "Probably skip it"
- Social element: "It's the whole point"
- Cost: "Genuinely stretching"
- Simpler version: "I haven't considered it"

**OUTPUT:**

#### Summary
You're considering a destination wedding, which would genuinely stretch your available resources.

#### ⚠ Dominant Friction
Social proof — the decision is driven by others rather than intrinsic interest.

#### ➡ Decision Lean
**This decision currently leans toward:** Lean toward letting it pass

High cost driven primarily by social factors rather than personal desire.

#### Confidence
📊 **High confidence — internally consistent**

#### Next Step
Declining this preserves resources for experiences driven by genuine personal interest.

**Disclaimer:** This reflection does not assess physical safety or risk. This app supports personal reflection only. All decisions remain your own.

---

## 4. Suggested Tech Stack for App Store Deployment

### Core Technologies

**Platform & Language:**
- **iOS:** 17.0+ (latest SwiftUI features)
- **Language:** Swift 5.9+
- **Framework:** SwiftUI (declarative, future-proof)
- **Architecture:** MVVM (industry standard, testable)

**Development Tools:**
- **IDE:** Xcode 15.0+
- **Version Control:** Git + GitHub
- **Package Management:** Swift Package Manager
- **Build System:** Xcode native

### Data & Storage

**Local Storage:**
- **v1.0:** JSON files via FileManager
  - Simple, debuggable
  - Location: ~/Documents/DecisionSessions/
  - Format: One JSON file per session

- **Future (v1.5+):** Core Data migration
  - Better performance at scale
  - Relationships and queries
  - Optional iCloud sync (user-controlled)

**Data Models:**
- Codable protocol for JSON serialization
- Value types (structs) for safety
- UUID identifiers for sessions

### UI/UX Stack

**Interface:**
- SwiftUI (declarative UI)
- Combine (reactive state management)
- NavigationStack (iOS 16+ navigation)

**Components:**
- Native iOS controls (no custom frameworks)
- SF Symbols (system icons)
- System colors (automatic dark mode)

**Accessibility:**
- VoiceOver support
- Dynamic Type
- High Contrast mode

### Privacy & Security

**Data Protection:**
- Local-only storage (no network calls)
- App Sandbox (iOS enforced isolation)
- No analytics SDK
- Privacy Manifest (PrivacyInfo.xcprivacy)

**Security:**
- No authentication (no credentials to leak)
- No external APIs (no attack surface)
- Input validation
- iOS-managed file permissions

### Testing & Quality

**Testing:**
- XCTest (unit testing)
- SwiftUI Previews (component testing)
- UI Testing (automation)
- TestFlight (beta distribution)

**Code Quality:**
- SwiftLint (optional, code style)
- Swift Concurrency (@MainActor)
- Type Safety (compile-time checks)

### Distribution

**App Store Prep:**
- Apple Developer Account ($99/year)
- App Store Connect
- TestFlight beta testing
- App Review process

**Build Configuration:**
- Development (debug builds)
- Release (optimized, archived)
- Semantic versioning (1.0.0)

**Required Assets:**
- App Icon (1024x1024 + device sizes)
- Screenshots (iPhone 6.7", 6.5", 5.5")
- Privacy Policy (hosted webpage)
- Support URL

### Dependencies

**ZERO external dependencies**

All functionality built with:
- Foundation (data types, JSON, file I/O)
- SwiftUI (user interface)
- Combine (reactive programming)

**Why no dependencies:**
- No version conflicts
- No security vulnerabilities
- No licensing issues
- Faster compilation
- Easier App Store review

### Future Scalability

**Phase 2:**
- Core Data (better data management)
- WidgetKit (home screen widgets)
- UserNotifications (local reminders)
- CloudKit (optional iCloud sync)

**Phase 3:**
- iPad optimization
- macOS Catalyst
- Machine Learning (local pattern recognition)
- Siri Shortcuts

---

## 5. UI/UX Tone Guidance

### Voice & Tone Principles

**What We Sound Like:**
- Calm, not anxious
- Intelligent, not academic
- Respectful, not condescending
- Direct, not preachy
- Warm, not cold

**What We Never Do:**
- Use imperative verbs ("should", "must", "don't")
- Make predictions ("you will", "this will")
- Assign blame or judgment
- Create urgency or pressure
- Use jargon without translation

### Language Guidelines

#### ✅ GOOD Examples

**Neutral Observation:**
- "You're considering X, mainly driven by timing."
- "This would require substantial weekly time."
- "Your projection suggests uncertainty about future use."

**Directional Without Prescription:**
- "This decision currently leans toward waiting."
- "Taking time to clarify may shift your perspective."
- "Declining this preserves capacity for other priorities."

**Acknowledging Complexity:**
- "Mixed signals suggest caution."
- "The trade-offs here aren't fully clear yet."
- "This involves exchanging one possibility for another."

**Framing Uncertainty:**
- "How this feels now may differ from how it feels later."
- "Anticipated use often differs from actual patterns."
- "Future value is harder to predict than present appeal."

#### ❌ BAD Examples (Never Use)

**Prescriptive:**
- ❌ "You should wait before buying this."
- ❌ "Don't commit to this right now."
- ❌ "You need to think this through more carefully."

**Judgmental:**
- ❌ "This is an impulse buy."
- ❌ "You're making a mistake."
- ❌ "This decision doesn't make sense."

**Predictive:**
- ❌ "You'll regret this purchase."
- ❌ "This will be a waste of money."
- ❌ "You won't use this as much as you think."

**Moralizing:**
- ❌ "Spending on experiences is better than things."
- ❌ "Saving money is always the smart choice."
- ❌ "You're being irresponsible with your time."

### Copy Templates

#### Question Framing
- Use open, non-leading questions
- Provide neutral option ("I'm not sure", "Hard to say")
- Keep options mutually exclusive
- Avoid loaded language

#### Reflection Output
- **Block 1 (Summary):** Factual rephrasing, no interpretation
- **Block 2 (Friction):** Name the tension, don't resolve it
- **Block 3 (Lean):** Direction without instruction
- **Block 4 (Confidence):** Honest about uncertainty
- **Block 5 (Next Step):** Permissive, not mandatory

### Visual Tone

**Typography:**
- Title: Large, bold, clear
- Body: Readable, comfortable spacing
- Labels: Uppercase, small, secondary color
- Emphasis: Weight and size, not color or decoration

**Color:**
- Primary: System default (user preference)
- Background: Calm, neutral
- Accents: Minimal, purposeful
- Icons: Functional, not decorative

**Spacing:**
- Generous (not cramped)
- Consistent vertical rhythm
- Clear visual hierarchy
- Breathing room around key elements

**Interaction:**
- Clear tap targets (44x44pt minimum)
- Immediate visual feedback
- No animation except transitions
- Progress indicated (question X of 5)

### Disclaimer Tone

**Category-Specific:**
- "This reflection is not financial advice." (Purchases, Investments)
- "This reflection does not account for external obligations." (Time & Energy)
- "This reflection does not assess physical safety or risk." (Experiences)

**Global:**
- "This app does not provide financial, medical, legal, or safety advice."
- "It supports personal reflection only."
- "All decisions remain your own."

**Placement:**
- Onboarding (first launch)
- Settings (always accessible)
- Category selection (global notice)
- Reflection output (category-specific)

### Error & Edge Case Messaging

**If user tries to skip question:**
- "This question helps generate your reflection."
- (Not: "You must answer this question.")

**If data doesn't save:**
- "Your reflection wasn't saved, but you can start a new one anytime."
- (Not: "Error: Save failed.")

**If category has no flows (shouldn't happen):**
- "This category is coming soon."
- (Not: "Not implemented yet.")

---

## 6. App Store Listing Copy

### App Name
**Decision Lean**

### Subtitle
Make fewer wrong decisions — without guilt or rules.

### Description

You don't need perfect rationality.
You just need a moment to think.

Decision Lean helps you pause before acting — without telling you what to do.

Whether you're about to buy something, commit your time, invest money, or say yes to an experience, the app guides you through a short reflection grounded in how people actually make decisions.

**No scores.**
**No advice.**
**No judgment.**

Just clearer thinking, one decision at a time.

**HOW IT WORKS:**
1. Choose your decision type
2. Answer 5 quick questions (60-90 seconds)
3. Get a personalized reflection with direction, not prescription

**CATEGORIES:**
- Purchases — Consumer goods, subscriptions, gadgets
- Investments — Financial decisions
- Time & Energy — Commitments and obligations
- Experiences — Travel, events, adventures

**YOUR PRIVACY:**
- All data stored locally on your device
- No tracking or analytics
- No account required
- No internet connection needed

**THE PHILOSOPHY:**
Inspired by behavioral economics research from Daniel Kahneman and others, Decision Lean surfaces cognitive biases without shame or moralization.

The goal isn't perfect rationality — just fewer wrong decisions.

### Keywords
decision making, behavioral economics, reflection, mindfulness, thinking, cognitive bias, purchases, mindful spending, time management, clarity

### What's New (Version 1.0)
Initial release of Decision Lean.

Make better decisions about purchases, investments, time commitments, and experiences through science-based reflection.

Complete privacy. No tracking. No judgment.

### Promotional Text
Pause before you act. Reflect before you decide. Think more clearly — without guilt or rules.

### Support URL
[Your website or GitHub repo]

### Marketing URL
[Optional]

### Privacy Policy URL
[Required — create and host]

---

## 7. Technical Implementation Summary

### Project Structure

```
DecisionLean/
├── App/
│   └── DecisionLeanApp.swift                 # @main entry point
│
├── Models/
│   ├── DecisionCategory.swift                # 4 categories
│   ├── Question.swift                        # Question & Answer types
│   ├── DecisionFlow.swift                    # Flow & Session management
│   └── ReflectionOutput.swift                # 5-block output structure
│
├── ViewModels/
│   ├── DecisionFlowViewModel.swift           # Main state management
│   ├── ReflectionGenerator.swift             # Decision Lean logic (all 4 categories)
│   └── FlowDefinitions.swift                 # 8 question flows (4 cats × 2 flows)
│
├── Views/
│   ├── HomeView.swift                        # Root navigation
│   ├── CategorySelectionView.swift           # Category picker + disclaimer
│   ├── QuestionFlowView.swift                # Question presentation
│   ├── ReflectionView.swift                  # 5-block output display
│   └── Components/
│       ├── CategoryCard.swift
│       ├── ProgressBar.swift
│       └── AnswerButton.swift
│
└── Services/
    └── PersistenceService.swift              # Local storage manager
```

### Implementation Status

✅ **COMPLETE:**
- All 4 categories fully implemented
- All 8 flows (2 per category)
- Complete reflection generator with Decision Lean logic
- 5-block output structure
- Confidence bands (Low/Medium/High)
- Disclaimers (global + category-specific)
- Privacy-first architecture
- Local persistence
- SwiftUI views with updated branding

### Decision Lean Options by Category

**Purchases:**
- Lean toward acting now
- Lean toward waiting
- Lean toward reframing the purchase

**Investments:**
- Lean toward caution
- Lean toward smaller exposure
- Lean toward acting deliberately

**Time & Energy:**
- Lean toward saying no
- Lean toward renegotiating scope
- Lean toward committing deliberately

**Experiences:**
- Lean toward acting now
- Lean toward simplifying
- Lean toward letting it pass

### Dominant Frictions by Category

**Purchases:**
- Urgency illusion
- Opportunity cost neglect
- Projection bias

**Investments:**
- Overconfidence
- Recency bias
- Loss aversion
- Outcome bias

**Time & Energy:**
- Planning fallacy
- Optimism bias
- Sunk cost thinking

**Experiences:**
- Affect heuristic
- Social proof
- Memory bias

### Key Features

**Privacy:**
- All data local
- No tracking
- No accounts
- No internet required

**UX:**
- 60-90 seconds per decision
- 5 questions max
- Minimal typing
- Clear visual hierarchy

**Output:**
1. Neutral Summary
2. Dominant Friction
3. Decision Lean (direction + explanation)
4. Confidence Band
5. Soft Next Step

**Disclaimers:**
- Global (onboarding + category selection)
- Category-specific (reflection output)
- Always visible, never obtrusive

---

## Next Steps to Launch

1. **Open in Xcode** — Create new iOS App project
2. **Copy all Swift files** — Import into project
3. **Configure signing** — Apple Developer team
4. **Build and test** — Simulator + device
5. **Create app icon** — Minimalist design
6. **Take screenshots** — All required sizes
7. **Write privacy policy** — Host on web
8. **Submit to TestFlight** — Beta testing
9. **App Store submission** — Full review
10. **Launch!** 🚀

---

## Philosophy Reminder

### What We Never Do
- Give direct advice
- Tell users what they "should" do
- Label decisions as good or bad
- Assign scores, ratings, or warnings
- Replace professional judgment or common sense

### What We Always Do
- Use calm, intelligent language
- Provide direction without prescription
- Acknowledge complexity and uncertainty
- Respect user autonomy
- Preserve complete privacy

### The Goal
**"The goal isn't perfect rationality — just fewer wrong decisions."**

---

**This is a product you can trust and use.**
