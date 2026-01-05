# Decision Reflection App - Deliverables

**"The goal isn't perfect rationality — just fewer wrong decisions."**

---

## 1. Screen Flow Overview (High-Level)

```
┌─────────────────────────────────┐
│    Launch App                   │
│    "Decision Reflection"        │
│                                 │
│    Category Selection:          │
│    ┌─────────────────────┐     │
│    │ 🛒 Purchases        │     │
│    │ 📈 Investments      │     │
│    │ ⏰ Time & Energy    │     │
│    │ ✨ Experiences      │     │
│    └─────────────────────┘     │
└────────────┬────────────────────┘
             │
             ↓ [User selects Purchases]
             │
┌────────────┴────────────────────┐
│  Random A/B Flow Assignment     │
│  (50% Flow A, 50% Flow B)       │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│  Question 1 of 5                │
│  ━━━━━━━━━━                     │
│                                 │
│  [Question Text]                │
│  [Input Field or Options]       │
│                                 │
│  [Continue →]                   │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│  Question 2 of 5                │
│  ━━━━━━━━━━━━━━━━━              │
│                                 │
│  [Question Text]                │
│  [Selection Options]            │
│                                 │
│  [← Back]  [Continue →]         │
└────────────┬────────────────────┘
             │
             ↓
         [Questions 3-5...]
             │
             ↓
┌─────────────────────────────────┐
│  Reflection                     │
│                                 │
│  ┌───────────────────────────┐ │
│  │ SUMMARY                   │ │
│  │ You're considering...     │ │
│  └───────────────────────────┘ │
│                                 │
│  ┌───────────────────────────┐ │
│  │ TRADE-OFF                 │ │
│  │ Choosing this likely...   │ │
│  └───────────────────────────┘ │
│                                 │
│  ┌───────────────────────────┐ │
│  │ LOOKING AHEAD             │ │
│  │ Decisions like this...    │ │
│  └───────────────────────────┘ │
│                                 │
│  ┌───────────────────────────┐ │
│  │ 💡 SOFT PAUSE             │ │
│  │ You don't need to decide  │ │
│  │ right now...              │ │
│  └───────────────────────────┘ │
│                                 │
│  [Reflect on Another Decision] │
└─────────────────────────────────┘
             │
             ↓
        [Reset to Start]
```

**User Journey:**
- Time: 60-90 seconds
- Interactions: 5-7 taps + minimal typing
- Exit points: Cancel button always available
- Data: Saved locally, never transmitted

---

## 2. Full Question Sets

### Flow A: Reflection-First (Introspective Framing)

**Targets:** Present bias, emotional awareness, future projection

#### Question 1
- **Text:** "What are you considering buying?"
- **Type:** Free text
- **Placeholder:** "e.g., noise-canceling headphones"
- **Behavioral Target:** Identification and commitment

#### Question 2
- **Text:** "Why does this feel like the right moment?"
- **Type:** Single choice
- **Options:**
  - I've been thinking about it for a while
  - It's on sale or feels limited
  - I'm reacting to how I feel right now
  - I don't really know
- **Behavioral Target:** Present bias, affect heuristic

#### Question 3
- **Text:** "If you buy this, what are you not choosing?"
- **Type:** Single choice
- **Options:**
  - Saving the money
  - Another purchase
  - Less clutter or mental space
  - Something else
- **Behavioral Target:** Opportunity cost neglect

#### Question 4
- **Text:** "Imagine yourself 30 days from now. What feels most likely?"
- **Type:** Single choice
- **Options:**
  - I'm glad I bought it
  - I feel neutral about it
  - I barely used it
  - I slightly regret it
- **Behavioral Target:** Projection bias

#### Question 5
- **Text:** "If this disappeared tomorrow, what would you most likely do?"
- **Type:** Single choice
- **Options:**
  - Buy an alternative
  - Do nothing and move on
  - Revisit it later
  - Feel annoyed or frustrated
- **Behavioral Target:** Loss aversion

---

### Flow B: Trade-off-First (Decision Economics Framing)

**Targets:** Value perception, opportunity cost, usage projection

#### Question 1
- **Text:** "What are you thinking of buying?"
- **Type:** Free text
- **Placeholder:** "e.g., smart watch"
- **Behavioral Target:** Identification and commitment

#### Question 2
- **Text:** "How does the cost compare to what you'd normally spend on this type of thing?"
- **Type:** Single choice
- **Options:**
  - Much less than usual
  - About typical
  - More than usual
  - Much more than usual
- **Behavioral Target:** Reference point anchoring

#### Question 3
- **Text:** "What else could this money become?"
- **Type:** Single choice
- **Options:**
  - Saved for something specific
  - Added to general savings
  - Spent on a different priority
  - Haven't thought about it
- **Behavioral Target:** Opportunity cost awareness

#### Question 4
- **Text:** "How often do you expect to use this in the next month?"
- **Type:** Single choice
- **Options:**
  - Daily or almost daily
  - A few times a week
  - Occasionally
  - Rarely or never
- **Behavioral Target:** Projection bias, planning fallacy

#### Question 5
- **Text:** "What would happen if you waited a week?"
- **Type:** Single choice
- **Options:**
  - The opportunity would be gone
  - The price might change
  - My interest might fade
  - Nothing would change
- **Behavioral Target:** Present bias, scarcity perception

---

## 3. Example Reflection Outputs

### Flow A Example: Impulse Purchase

**User Scenario:**
- Item: "Designer sneakers"
- Timing: "It's on sale or feels limited"
- Trade-off: "Another purchase"
- Future feeling: "I barely used it"
- If gone: "Do nothing and move on"

**Generated Reflection:**

#### Summary
You're considering buying designer sneakers, mainly driven by timing and current availability.

#### Trade-off
Making this purchase creates a trade-off with other things you might buy.

#### Looking Ahead
You're noticing uncertainty about future use. Items often receive different amounts of attention than we initially imagine.

#### 💡 Soft Pause
You don't need to decide right now. Revisiting this later may give you a clearer signal.

---

### Flow A Example: Confident Purchase

**User Scenario:**
- Item: "Noise-canceling headphones"
- Timing: "I've been thinking about it for a while"
- Trade-off: "Saving the money"
- Future feeling: "I'm glad I bought it"
- If gone: "Buy an alternative"

**Generated Reflection:**

#### Summary
You're considering buying noise-canceling headphones, something that's been on your mind for some time.

#### Trade-off
Choosing this likely means setting aside the option to save this money for now.

#### Looking Ahead
You anticipate positive feelings about this. Purchases that meet ongoing needs tend to maintain their value over time.

---

### Flow B Example: High Cost, Low Use

**User Scenario:**
- Item: "Espresso machine"
- Cost: "Much more than usual"
- Alternative: "Haven't thought about it"
- Expected use: "Rarely or never"
- Waiting: "My interest might fade"

**Generated Reflection:**

#### Summary
You're considering an espresso machine, which represents a higher investment than you'd usually make in this category.

#### Trade-off
The opportunity cost here hasn't been fully explored yet. Money spent here becomes unavailable elsewhere.

#### Looking Ahead
You're noticing limited expected use. Infrequent engagement often means the value lives more in ownership than in active use.

#### 💡 Soft Pause
Your own signal suggests time could clarify this. The impulse itself may contain information.

---

### Flow B Example: Daily Use Item

**User Scenario:**
- Item: "Standing desk"
- Cost: "About typical"
- Alternative: "Saved for something specific"
- Expected use: "Daily or almost daily"
- Waiting: "Nothing would change"

**Generated Reflection:**

#### Summary
You're considering a standing desk at a price point that feels about typical for you.

#### Trade-off
This money currently has another destination in mind. Choosing this changes what's available for that specific goal.

#### Looking Ahead
You expect this to integrate into your routine. Items used frequently tend to justify their presence over time.

#### 💡 Soft Pause
The option remains stable. Delayed decisions about stable opportunities rarely become worse.

---

## 4. Suggested Tech Stack (App Store Ready)

### Core Technologies

**Platform & Language**
- **iOS:** 17.0+ (enables latest SwiftUI features)
- **Language:** Swift 5.9+
- **Framework:** SwiftUI (declarative, future-proof)
- **Architecture:** MVVM (industry standard, testable)

**Why iOS-first:**
- Higher user engagement on iOS for paid apps
- Premium positioning aligns with target audience
- Better privacy controls
- Smoother App Store review process

### Development Tools

**IDE & Build**
- **Xcode:** 15.0+ (required for iOS 17)
- **Swift Package Manager:** Built-in dependency management (currently: zero dependencies)
- **Build System:** Xcode native build

**Version Control**
- **Git:** Standard version control
- **GitHub:** Code hosting and collaboration

### Data & Storage

**Local Storage**
- **Current (v1):** JSON files via FileManager
  - Simple, debuggable, no migration complexity
  - Location: ~/Documents/DecisionSessions/
  - Format: One JSON file per session

- **Future (v1.5+):** Core Data migration
  - Better performance at scale
  - Relationships and queries
  - iCloud sync option (user-controlled)

**Data Models**
- **Codable protocol:** JSON serialization
- **Value types (structs):** Memory safety, immutability
- **UUID identifiers:** Session tracking

### UI/UX Technologies

**Interface**
- **SwiftUI:** Declarative UI framework
- **Combine:** Reactive state management
- **NavigationStack:** iOS 16+ navigation

**Components**
- **Native iOS controls:** No custom frameworks
- **SF Symbols:** System icons (cart, chart, clock, sparkles)
- **System colors:** Automatic dark mode support

**Accessibility**
- **VoiceOver:** Full screen reader support
- **Dynamic Type:** Text size adaptation
- **High Contrast:** System color support

### Privacy & Security

**Data Protection**
- **Local-only storage:** No network calls
- **App Sandbox:** iOS enforced isolation
- **No analytics SDK:** No tracking code
- **Privacy Manifest:** PrivacyInfo.xcprivacy included

**Security Measures**
- **No authentication:** No credentials to leak
- **No external APIs:** No attack surface
- **Input validation:** Sanitized user input
- **File permissions:** iOS-managed access control

### Testing & Quality

**Testing Frameworks**
- **XCTest:** Unit testing (ReflectionGenerator, ViewModels)
- **SwiftUI Previews:** Component visual testing
- **UI Testing:** XCTest UI automation
- **Manual Testing:** TestFlight beta distribution

**Code Quality**
- **SwiftLint:** (Optional) Code style enforcement
- **Swift Concurrency:** @MainActor for thread safety
- **Type Safety:** Compile-time error prevention

### Distribution & Deployment

**App Store Preparation**
- **Apple Developer Account:** Required ($99/year)
- **App Store Connect:** Metadata and build management
- **TestFlight:** Beta testing (up to 10,000 users)
- **App Review:** Submission and approval process

**Build Configuration**
- **Development:** Debug builds for testing
- **Release:** Optimized, archived builds
- **Versioning:** Semantic versioning (1.0.0)

**Required Assets**
- **App Icon:** 1024x1024 + device sizes
- **Screenshots:** iPhone 6.7", 6.5", 5.5"
- **Privacy Policy:** Hosted webpage (required)
- **Support URL:** Contact or documentation

### Performance Optimization

**Memory Management**
- **ARC:** Automatic reference counting
- **Value types:** Copy-on-write efficiency
- **Lazy loading:** On-demand resource loading

**UI Performance**
- **Minimal view hierarchy:** Fast rendering
- **Local state:** Efficient SwiftUI updates
- **No heavy computations:** Instant interactions

### Future Scalability

**Phase 2 Enhancements**
- **Core Data:** Better data management
- **WidgetKit:** Home screen widgets
- **UserNotifications:** Local reminders (opt-in)
- **CloudKit:** Optional iCloud sync

**Phase 3 Capabilities**
- **iPad optimization:** Adaptive layouts
- **macOS Catalyst:** Desktop version
- **Machine Learning:** Local pattern recognition (CreateML)
- **Shortcuts:** Siri integration

### Zero External Dependencies

**Why no dependencies:**
- ✓ No version conflicts or breaking changes
- ✓ No supply chain security risks
- ✓ No licensing complications
- ✓ Faster compile times
- ✓ Easier App Store review
- ✓ Full code ownership and control

**All functionality built with:**
- Foundation (data types, JSON, file I/O)
- SwiftUI (user interface)
- Combine (reactive programming)

### Recommended Development Setup

**Hardware**
- **Mac:** M1 or later (best performance)
- **RAM:** 16GB minimum
- **Storage:** 256GB minimum (Xcode + simulators)

**Software**
- **macOS:** 14.0 (Sonoma) or later
- **Xcode:** 15.0+
- **iOS Devices:** iPhone 12 or later for testing

**Accounts**
- **Apple ID:** Developer account
- **GitHub:** Version control
- **App Store Connect:** Distribution

---

## Project File Structure

```
DecisionReflection/
├── App/
│   └── DecisionReflectionApp.swift          # @main entry point
│
├── Models/                                   # Data layer
│   ├── DecisionCategory.swift                # Purchases, Investments, etc.
│   ├── Question.swift                        # Question & Answer types
│   ├── DecisionFlow.swift                    # Flow & Session management
│   └── ReflectionOutput.swift                # Reflection data structure
│
├── ViewModels/                               # Business logic
│   ├── DecisionFlowViewModel.swift           # Main state management
│   ├── ReflectionGenerator.swift             # Personalized output logic
│   └── FlowDefinitions.swift                 # Question flow configurations
│
├── Views/                                    # UI layer
│   ├── HomeView.swift                        # Root navigation view
│   ├── CategorySelectionView.swift           # Category picker
│   ├── QuestionFlowView.swift                # Question presentation
│   ├── ReflectionView.swift                  # Reflection display
│   └── Components/
│       ├── CategoryCard.swift                # Category selection card
│       ├── ProgressBar.swift                 # Question progress indicator
│       └── AnswerButton.swift                # Answer option button
│
├── Services/                                 # System services
│   └── PersistenceService.swift              # Local storage manager
│
├── Resources/                                # Assets
│   └── Assets.xcassets/                      # Icons, colors
│
└── Tests/                                    # Test suites
    ├── DecisionReflectionTests/              # Unit tests
    └── DecisionReflectionUITests/            # UI automation tests
```

---

## Getting Started

### Immediate Next Steps

1. **Open Xcode 15+**
2. **Create new iOS App project** named "DecisionReflection"
3. **Copy all Swift files** from the repository into your project
4. **Configure signing** with your Apple Developer team
5. **Build and run** on simulator (Cmd + R)
6. **Test on device** via USB connection
7. **Submit to TestFlight** for beta testing

### Full Setup Instructions

See `docs/SETUP_GUIDE.md` for complete Xcode project setup, App Store preparation, and deployment instructions.

### Documentation

- **README.md** — Quick start and overview
- **docs/DESIGN.md** — Complete design philosophy and UI specifications
- **docs/EXAMPLES.md** — Detailed reflection output examples
- **docs/TECHNICAL.md** — Architecture and implementation details
- **docs/PRODUCT_SUMMARY.md** — Product strategy and business model
- **docs/SETUP_GUIDE.md** — Xcode setup and App Store deployment

---

## What Makes This Production-Ready

✅ **Complete implementation** — All code written and tested
✅ **Clean architecture** — MVVM with clear separation of concerns
✅ **Privacy-first** — No tracking, no accounts, all data local
✅ **Behavioral science** — Grounded in proven research
✅ **Non-judgmental design** — Neutral tone throughout
✅ **App Store ready** — Zero dependencies, privacy manifest included
✅ **Comprehensive docs** — Design, technical, and setup guides
✅ **Extensible foundation** — Ready for future categories and features

---

## Philosophy Reminder

**Never:**
- Tell users what to do
- Label decisions as good or bad
- Score or rank decisions
- Moralize behavior

**Always:**
- Use calm, intelligent language
- Respect autonomy
- Preserve privacy
- Stay emotionally neutral

**Goal:**
"The goal isn't perfect rationality — just fewer wrong decisions."

---

**This is a product you can trust and use.**
