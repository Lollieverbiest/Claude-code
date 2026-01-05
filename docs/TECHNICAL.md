# Technical Architecture

## Overview

Decision Reflection is a native iOS app built with SwiftUI, designed for privacy-first local operation with no backend dependencies.

## Tech Stack

### Core Technologies
- **Language:** Swift 5.9+
- **UI Framework:** SwiftUI
- **Architecture:** MVVM (Model-View-ViewModel)
- **Storage:** Local JSON files (prepared for Core Data)
- **Platform:** iOS 17.0+
- **Dependencies:** None (vanilla SwiftUI)

### Why These Choices

**SwiftUI over UIKit:**
- Declarative UI reduces complexity
- Better state management
- Native iOS 17+ features
- Future-proof

**MVVM Architecture:**
- Clear separation of concerns
- Testable business logic
- SwiftUI-native pattern
- Scalable for future features

**Local JSON over Core Data:**
- Simpler for v1
- Easier debugging
- No migration complexity initially
- Easy to migrate later

**No Dependencies:**
- Faster builds
- No supply chain risk
- Full control
- App Store approval confidence

## Project Structure

```
DecisionReflection/
│
├── App/
│   └── DecisionReflectionApp.swift          # App entry point
│
├── Models/                                   # Data models
│   ├── DecisionCategory.swift                # Category enum
│   ├── Question.swift                        # Question & Answer models
│   ├── DecisionFlow.swift                    # Flow & Session models
│   └── ReflectionOutput.swift                # Reflection model
│
├── ViewModels/                               # Business logic
│   ├── DecisionFlowViewModel.swift           # Main VM for flow state
│   ├── ReflectionGenerator.swift             # Reflection logic
│   └── FlowDefinitions.swift                 # Flow configurations
│
├── Views/                                    # SwiftUI views
│   ├── HomeView.swift                        # Root navigation
│   ├── CategorySelectionView.swift           # Category picker
│   ├── QuestionFlowView.swift                # Question presenter
│   ├── ReflectionView.swift                  # Reflection display
│   └── Components/                           # Reusable components
│       ├── CategoryCard.swift
│       ├── ProgressBar.swift
│       └── AnswerButton.swift
│
├── Services/                                 # System services
│   └── PersistenceService.swift              # Local storage
│
└── Resources/                                # Static resources
    └── (Future: Flow JSON configs)
```

## Core Architecture

### Data Flow

```
User Interaction
       ↓
    View
       ↓
  ViewModel (ObservableObject)
       ↓
    Model
       ↓
 Persistence Service
       ↓
  Local Storage
```

### State Management

**Single Source of Truth:**
- `DecisionFlowViewModel` owns all session state
- Published properties trigger view updates
- SwiftUI handles UI reactivity

**Key Published Properties:**
```swift
@Published var selectedCategory: DecisionCategory?
@Published var currentSession: DecisionSession?
@Published var currentQuestionIndex: Int
@Published var currentAnswers: [String: String]
@Published var reflection: ReflectionOutput?
@Published var isComplete: Bool
```

### Navigation Pattern

**NavigationStack-based:**
- Single stack for entire app
- View switching via conditional rendering
- No deep navigation hierarchy

**State-driven rendering:**
```swift
if viewModel.currentSession == nil {
    CategorySelectionView()
} else if viewModel.isComplete {
    ReflectionView()
} else {
    QuestionFlowView()
}
```

## Key Components

### Models

#### DecisionCategory
- Enum defining decision types
- Provides UI metadata (icons, descriptions)
- Codable for future persistence

#### Question & Answer
- Immutable value types
- Support multiple input types
- Timestamped answers for future analytics

#### DecisionFlow
- Contains question sequence
- Associates flow type with category
- Supports A/B testing

#### DecisionSession
- Active decision-making session
- Tracks answers and progress
- Immutable updates (copy-on-write)

#### ReflectionOutput
- Structured reflection result
- Generated from completed session
- Persisted for history

### ViewModels

#### DecisionFlowViewModel
**Responsibilities:**
- Manages session lifecycle
- Tracks question progression
- Validates and stores answers
- Triggers reflection generation
- Coordinates with persistence

**Key Methods:**
```swift
func startFlow(for: DecisionCategory)
func saveAnswer(_ value: String, for: String)
func nextQuestion()
func previousQuestion()
func completeFlow()
func reset()
```

#### ReflectionGenerator
**Responsibilities:**
- Generates personalized reflections
- Implements behavioral economics logic
- Maintains neutral tone
- Category-specific templates

**Key Method:**
```swift
static func generate(from: DecisionSession) -> ReflectionOutput
```

#### FlowDefinitions
**Responsibilities:**
- Defines all question flows
- Centralized flow configuration
- Supports random flow selection
- Easy to extend with new flows

### Services

#### PersistenceService
**Responsibilities:**
- Local file I/O
- JSON encoding/decoding
- Session CRUD operations
- Directory management

**Storage Location:**
```
~/Documents/DecisionSessions/
  └── {session-id}.json
```

**Key Methods:**
```swift
func saveSession(_ session: DecisionSession)
func loadSession(id: String) -> DecisionSession?
func loadAllSessions() -> [DecisionSession]
func deleteSession(id: String)
func deleteAllSessions()
```

### Views

#### HomeView
- Root view with NavigationStack
- Owns DecisionFlowViewModel
- State-driven view switching

#### CategorySelectionView
- Displays available categories
- Filters by implemented flows
- Initiates decision flow

#### QuestionFlowView
- Displays current question
- Handles answer input
- Manages navigation (back/continue)
- Shows progress

#### ReflectionView
- Displays structured reflection
- Provides reset action
- Clean, readable layout

## Privacy & Security

### Data Privacy
- **Local-only storage** — No network calls
- **No analytics** — No tracking code
- **No identifiers** — Anonymous sessions
- **User-deletable** — Full data control

### Security Considerations
- No sensitive data collected
- No authentication required
- No external dependencies
- Sandboxed storage

## Performance

### Optimization Strategies
- Minimal view hierarchy
- Lazy loading of flows
- Efficient SwiftUI updates
- No heavy computations

### Memory Management
- Value types for models
- Weak references where needed
- Automatic reference counting
- No retain cycles

## Testing Strategy

### Unit Tests
- ReflectionGenerator logic
- FlowDefinitions correctness
- PersistenceService I/O
- ViewModel state transitions

### UI Tests
- Complete flow walkthrough
- Answer selection
- Navigation flow
- Edge cases

### Manual Testing
- VoiceOver navigation
- Dynamic Type sizing
- Dark mode appearance
- iPad layout

## Build & Deployment

### Xcode Project Setup
1. Create new iOS App project
2. Set deployment target: iOS 17.0+
3. Enable SwiftUI
4. Add all source files
5. Configure signing

### App Store Preparation
- **Bundle ID:** com.yourcompany.decisionreflection
- **Version:** 1.0.0
- **Privacy Policy:** Required (local data storage)
- **App Category:** Productivity or Health & Fitness
- **Keywords:** decision, reflection, behavioral economics, thinking

### Required Metadata
- App name: Decision Reflection
- Subtitle: Fewer wrong decisions
- Description: Emphasize privacy, science-based, non-judgmental
- Screenshots: All device sizes
- App icon: Minimalist, calm design

## Future Technical Enhancements

### Phase 2 Features
- **Core Data migration** — Better performance, relationships
- **Widgets** — Quick decision prompts
- **Notifications** — Optional reminders (local only)
- **Export** — JSON export of history

### Phase 3 Features
- **iPad optimization** — Larger screen layouts
- **Pattern insights** — Local ML analysis
- **Custom flows** — User-created questions
- **Themes** — Visual customization

### Scalability Considerations
- Flow definition externalization (JSON)
- Modular reflection logic
- Plugin architecture for categories
- Extensible storage backend

## Development Workflow

### Adding a New Category

1. **Update Model:**
```swift
enum DecisionCategory {
    case newCategory = "New Category"
}
```

2. **Create Flow Definitions:**
```swift
static let newCategoryFlowA = DecisionFlow(...)
static let newCategoryFlowB = DecisionFlow(...)
```

3. **Add Reflection Logic:**
```swift
case .newCategory:
    return generateNewCategoryReflection(...)
```

4. **Register Flows:**
```swift
case .newCategory:
    return [newCategoryFlowA, newCategoryFlowB]
```

### Adding a New Question

1. Create Question instance
2. Add to flow's questions array
3. Update reflection logic to use answer
4. Test thoroughly

### Modifying Reflection Logic

1. Update ReflectionGenerator
2. Test with various answer combinations
3. Verify neutral tone
4. Check all edge cases

## Code Quality Standards

### Swift Style
- Follow Swift API Design Guidelines
- Use clear, descriptive names
- Prefer immutability
- Document complex logic

### SwiftUI Best Practices
- Prefer composition over inheritance
- Extract reusable components
- Use @State for view-local state
- Use @ObservedObject for shared state

### Comments
- Document "why", not "what"
- Explain behavioral economics rationale
- Note edge cases
- Reference research where relevant

## Dependencies

**None** — This is intentional.

All functionality is implemented using native iOS frameworks:
- Foundation (data types, JSON)
- SwiftUI (UI framework)
- Combine (reactive programming)

Benefits:
- No version conflicts
- No security vulnerabilities
- No licensing issues
- Full control over codebase
- Faster compilation
- Easier App Store review

## Debugging & Monitoring

### Console Logging
- Minimal logging in production
- Error logging for file I/O
- No user data in logs

### Xcode Instruments
- Monitor memory usage
- Profile UI performance
- Test on actual devices

### User Feedback
- No crash reporting SDK
- Manual bug reports only
- Privacy-preserving

## Localization

### Current: English Only
- en-US strings
- Single language support

### Future: Multi-language
- Externalize strings
- RTL layout support
- Cultural adaptation of examples
- Professional translation required
