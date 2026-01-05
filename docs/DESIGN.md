# Design Documentation

## Philosophy

**"The goal isn't perfect rationality — just fewer wrong decisions."**

This app reduces cognitive bias without shaming users. Every design decision supports this core principle.

## Core Principles

### What We Never Do
- Tell users what to do
- Label decisions as good or bad
- Score or rank decisions
- Moralize spending or behavior
- Use gamification
- Add streaks, points, or warnings

### What We Always Do
- Use calm, intelligent language
- Maintain minimalist UI
- Preserve privacy (local-first)
- Stay emotionally neutral
- Keep interactions under 90 seconds

## Screen Flow Overview

```
┌─────────────────────┐
│  Category Selection │
│                     │
│  - Purchases        │
│  - Investments      │
│  - Time & Energy    │
│  - Experiences      │
└──────────┬──────────┘
           │
           ↓
    [Random A/B Flow Selection]
           │
           ↓
┌─────────────────────┐
│   Question 1 of 5   │
│   ─────────────     │
│                     │
│  [Question Text]    │
│  [Answer Options]   │
│                     │
│  [Continue Button]  │
└──────────┬──────────┘
           │
           ↓
┌─────────────────────┐
│   Question 2 of 5   │
│   ──────────────    │
│                     │
│  [Question Text]    │
│  [Answer Options]   │
│                     │
│  [Back] [Continue]  │
└──────────┬──────────┘
           │
           ↓
        [... 3-5 ...]
           │
           ↓
┌─────────────────────┐
│    Reflection       │
│                     │
│  Neutral Summary    │
│  Trade-off Spotlight│
│  Future Reflection  │
│  Soft Pause         │
│                     │
│  [New Decision]     │
└─────────────────────┘
```

## Decision Categories (v1)

### Purchases
**Description:** Consumer goods, subscriptions, gadgets
**Icon:** cart
**Flows:** 2 (A/B testing)

**Flow A - Reflection-First**
- Introspective framing
- Emphasizes emotional awareness
- Surfaces internal motivations

**Flow B - Trade-off-First**
- Decision economics framing
- Emphasizes concrete costs
- Surfaces opportunity costs

### Future Categories
- **Investments** — Financial decisions
- **Time & Energy** — Commitments and obligations
- **Experiences** — Travel, events, memories

## Question Design Principles

### Behavioral Economics Foundation

Each question targets specific cognitive biases:

| Bias | Description | How We Surface It |
|------|-------------|-------------------|
| **Present Bias** | Overweighting immediate rewards | "Why does this feel like the right moment?" |
| **Loss Aversion** | Fear of losing what we have | "What are you not choosing?" |
| **Opportunity Cost Neglect** | Ignoring alternatives | "What else could this money become?" |
| **Projection Bias** | Overestimating future preferences | "How often do you expect to use this?" |
| **Affect Heuristic** | Decisions driven by emotion | "I'm reacting to how I feel right now" |

### Language Guidelines

**DO:**
- Use neutral observation language
- Frame uncertainty without prediction
- Acknowledge complexity
- Respect user autonomy

**DON'T:**
- Use imperative verbs (should, must, need to)
- Make value judgments
- Predict outcomes
- Create pressure

### Input Types

**Free Text**
- Used only when necessary (Q1 of each flow)
- Short responses expected
- Clear placeholder examples

**Single Choice**
- Default for most questions
- 4 options maximum
- Mutually exclusive
- Covers the possibility space

**Multiple Choice**
- Reserved for future use
- When multiple factors apply

## Reflection Output Structure

### 1. Neutral Summary
**Purpose:** Factual rephrasing without interpretation
**Tone:** Observational, descriptive
**Length:** 1-2 sentences

**Template Logic:**
- State the item/decision
- Note primary motivation
- No judgment or advice

### 2. Trade-off Spotlight
**Purpose:** Surface one implicit cost
**Tone:** Informational, matter-of-fact
**Length:** 1 sentence

**Template Logic:**
- Identify what's being exchanged
- Name the opportunity cost
- Remain value-neutral

### 3. Future-Oriented Reflection
**Purpose:** Frame uncertainty without prediction
**Tone:** Thoughtful, nuanced
**Length:** 1-2 sentences

**Template Logic:**
- Acknowledge user's expectation
- Provide research-based context
- Avoid prescriptive language

### 4. Optional Soft Pause
**Purpose:** Non-directive suggestion to wait
**Tone:** Permissive, gentle
**Length:** 1 sentence

**Trigger Conditions:**
- High uncertainty in answers
- Present bias indicators
- Low expected satisfaction

## UI/UX Specifications

### Color Palette
- **Primary:** System default (adapts to user preference)
- **Background:** System grouped background
- **Cards:** System background with subtle shadow
- **Text:** Primary and secondary system colors
- **Accents:** Minimal, only for selected states

### Typography
- **Title:** Large Title, Bold
- **Headlines:** Title 2-3, Medium weight
- **Body:** System default, Regular
- **Captions:** Caption, Uppercase, Medium

### Spacing
- **Outer margin:** 24pt
- **Card padding:** 20pt
- **Section spacing:** 32pt
- **Element spacing:** 12-16pt

### Components

**Category Card**
- Icon (top-left)
- Title (bold)
- Description (secondary)
- Full-width tap target
- Subtle shadow

**Answer Button**
- Left-aligned text
- 16pt padding
- Full-width
- Clear selected state
- No icons or decoration

**Progress Bar**
- 4pt height
- Top of question view
- Subtle, non-obtrusive
- No percentage text

**Reflection Section**
- Optional uppercase label
- Body text content
- Card-style background
- Optional highlight border

## Accessibility

- Full VoiceOver support
- Dynamic Type support
- High contrast mode compatible
- Minimum tap targets: 44x44pt
- Clear focus indicators
- No color-only information

## Privacy & Data

### What We Store Locally
- Decision sessions (anonymous)
- Timestamps
- Question answers
- Generated reflections

### What We Never Store
- Personal identifying information
- Analytics or usage tracking
- Device identifiers
- Cloud backups (unless user-enabled)

### User Control
- View all past decisions
- Delete individual sessions
- Delete all data
- No account required

## Future Considerations

### Planned Features
- Decision history view
- Pattern insights (non-judgmental)
- Optional reminder system
- Additional categories

### Technical Scalability
- Prepared for Core Data migration
- Designed for widget support
- Ready for iPad optimization
- Extensible flow system

### A/B Testing Strategy
- Random flow assignment
- No user-facing indication of flow type
- Session data includes flow type
- Future analytics (opt-in only)
