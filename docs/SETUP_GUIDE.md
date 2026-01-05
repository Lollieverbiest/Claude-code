# Setup Guide

This guide walks you through setting up the Decision Reflection iOS app in Xcode.

## Prerequisites

- macOS 14.0 (Sonoma) or later
- Xcode 15.0 or later
- iOS 17.0+ device or simulator
- Apple Developer account (for device testing and App Store)

## Project Setup

### 1. Create New Xcode Project

1. Open Xcode
2. Select **File > New > Project**
3. Choose **iOS > App**
4. Configure your project:
   - **Product Name:** DecisionReflection
   - **Team:** Select your development team
   - **Organization Identifier:** com.yourcompany (use your own)
   - **Bundle Identifier:** com.yourcompany.DecisionReflection
   - **Interface:** SwiftUI
   - **Language:** Swift
   - **Storage:** None (we handle this manually)
   - **Include Tests:** Yes

5. Save to this repository location

### 2. Add Source Files

Copy all files from the repository into your Xcode project:

1. **Delete** the default `ContentView.swift` and `DecisionReflectionApp.swift` that Xcode created
2. **Add folders** to project:
   - Right-click project navigator → Add Files
   - Select `DecisionReflection` folder
   - Check "Copy items if needed"
   - Check "Create groups"
   - Ensure target membership is checked

Your project navigator should look like:
```
DecisionReflection
├── App
│   └── DecisionReflectionApp.swift
├── Models
│   ├── DecisionCategory.swift
│   ├── Question.swift
│   ├── DecisionFlow.swift
│   └── ReflectionOutput.swift
├── ViewModels
│   ├── DecisionFlowViewModel.swift
│   ├── ReflectionGenerator.swift
│   └── FlowDefinitions.swift
├── Views
│   ├── HomeView.swift
│   ├── CategorySelectionView.swift
│   ├── QuestionFlowView.swift
│   ├── ReflectionView.swift
│   └── Components
│       ├── CategoryCard.swift
│       ├── ProgressBar.swift
│       └── AnswerButton.swift
└── Services
    └── PersistenceService.swift
```

### 3. Configure Project Settings

#### General Tab
- **Deployment Target:** iOS 17.0
- **Device:** iPhone (or Universal for iPad support)
- **Supported Destinations:** iPhone, iPad (optional)

#### Signing & Capabilities
- **Automatically manage signing:** Checked
- **Team:** Select your Apple Developer team
- **Bundle Identifier:** Ensure it's unique (e.g., com.yourname.DecisionReflection)

#### Info Tab
Add the following keys:
- **Privacy - Photo Library Usage Description:** (Only if adding screenshots feature)
  - "Decision Reflection does not access your photo library"

#### Build Settings
- **Swift Language Version:** Swift 5
- **User Script Sandboxing:** Yes

### 4. App Icon & Assets

#### Create App Icon
1. Create a simple, minimalist icon design
2. Generate all required sizes using an icon generator:
   - 1024x1024 (App Store)
   - Various sizes for iPhone/iPad
3. Add to Assets.xcassets > AppIcon

**Design Guidelines:**
- Minimalist aesthetic
- Calm colors (blues, greens, neutrals)
- No text in icon
- Suggestion: A simplified lightbulb, thought bubble, or balance scale

#### Optional: Add Launch Screen
1. Assets.xcassets > Create new Color Set named "LaunchBackground"
2. Set to system background color
3. Keep launch screen minimal and fast

### 5. Privacy Manifest (Required for App Store)

Create `PrivacyInfo.xcprivacy`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>NSPrivacyTracking</key>
    <false/>
    <key>NSPrivacyTrackingDomains</key>
    <array/>
    <key>NSPrivacyCollectedDataTypes</key>
    <array/>
    <key>NSPrivacyAccessedAPITypes</key>
    <array>
        <dict>
            <key>NSPrivacyAccessedAPIType</key>
            <string>NSPrivacyAccessedAPICategoryFileTimestamp</string>
            <key>NSPrivacyAccessedAPITypeReasons</key>
            <array>
                <string>C617.1</string>
            </array>
        </dict>
    </array>
</dict>
</plist>
```

### 6. Build and Run

1. Select a simulator or connected device
2. Press **Cmd + R** to build and run
3. The app should launch and show the category selection screen

**Expected behavior:**
- Category selection screen displays
- Purchases category is available
- Other categories show but are not yet implemented
- Clicking Purchases starts a question flow
- Completing 5 questions shows reflection

### 7. Testing Checklist

**Functional Tests:**
- [ ] App launches successfully
- [ ] Category selection displays
- [ ] Purchases flow A completes
- [ ] Purchases flow B completes
- [ ] Reflection displays correctly
- [ ] Back button works during questions
- [ ] Reset returns to category selection
- [ ] Text input accepts and saves answers
- [ ] Choice buttons select properly
- [ ] Progress bar updates correctly

**UI/UX Tests:**
- [ ] Dark mode displays correctly
- [ ] Dynamic Type scales properly (Settings > Accessibility > Display & Text Size)
- [ ] VoiceOver navigation works (Settings > Accessibility > VoiceOver)
- [ ] Rotation works (if supporting landscape)
- [ ] Safe areas respected on all devices
- [ ] Keyboard dismisses properly

**Edge Cases:**
- [ ] Very long purchase names display properly
- [ ] Rapid tapping doesn't cause issues
- [ ] App backgrounding/foregrounding works
- [ ] Memory usage is reasonable

## Common Issues & Solutions

### Issue: "No such module" errors
**Solution:** Clean build folder (Cmd + Shift + K), then rebuild

### Issue: App crashes on launch
**Solution:** Check that DecisionReflectionApp.swift is set as @main entry point

### Issue: Views not updating
**Solution:** Ensure ViewModel uses @Published and View uses @ObservedObject

### Issue: Files not found
**Solution:** Check target membership in File Inspector (right panel)

### Issue: Signing errors
**Solution:** Ensure Bundle ID is unique and team is selected

## Development Workflow

### Daily Development
1. Pull latest changes from git
2. Open .xcodeproj in Xcode
3. Build and test on simulator
4. Make changes
5. Test on device before committing
6. Commit and push

### Before Committing
- [ ] Build succeeds with no warnings
- [ ] All tests pass
- [ ] App runs on simulator
- [ ] Code is formatted
- [ ] No debug print statements

### Testing on Device
1. Connect iPhone via USB
2. Select device in Xcode toolbar
3. Unlock device and trust computer
4. Build and run (Cmd + R)
5. Test all flows thoroughly

## App Store Preparation

### 1. Create App Store Connect Entry
1. Go to https://appstoreconnect.apple.com
2. Select "My Apps"
3. Click "+" to add new app
4. Fill in app information:
   - **Name:** Decision Reflection
   - **Primary Language:** English (U.S.)
   - **Bundle ID:** Select your configured bundle ID
   - **SKU:** decisionreflection-v1
   - **User Access:** Full Access

### 2. Prepare Metadata

**App Information:**
- **Name:** Decision Reflection
- **Subtitle:** Fewer wrong decisions
- **Privacy Policy URL:** Required (create and host)
- **Category:** Primary: Productivity, Secondary: Lifestyle
- **Content Rights:** You own the rights

**Version Information:**
- **Description:**
```
Make better decisions through reflection, not judgment.

Based on behavioral economics research, Decision Reflection helps you see your choices more clearly. Answer 5 quick questions about a purchase, investment, or commitment, and receive personalized insight into what you're actually choosing.

No tracking. No scoring. No judgment. Just clearer thinking.

FEATURES:
• Quick 90-second reflection process
• Grounded in behavioral economics
• Completely private (all data local)
• No account required
• Clean, minimalist design

DECISION CATEGORIES:
• Purchases (goods, subscriptions, gadgets)
• Investments (coming soon)
• Time & Energy (coming soon)
• Experiences (coming soon)

PRIVACY FIRST:
• All data stored on your device
• No tracking or analytics
• No account required
• No ads, ever

THE PHILOSOPHY:
"The goal isn't perfect rationality — just fewer wrong decisions."

Based on research by Nobel Prize winner Daniel Kahneman and other behavioral economists, this app helps surface cognitive biases without shaming or moralizing.
```

- **Keywords:** decision making, behavioral economics, reflection, mindfulness, thinking, cognitive bias, purchases, mindful spending
- **Support URL:** Your website or GitHub repo
- **Marketing URL:** Optional

**What's New (Version 1.0):**
```
Initial release of Decision Reflection.

Make better decisions about purchases through science-based reflection. Answer 5 questions, receive personalized insight, maintain complete privacy.

More categories coming soon!
```

### 3. Screenshots

Required sizes (can be generated in Xcode):
- iPhone 6.7" (iPhone 14 Pro Max)
- iPhone 6.5" (iPhone 11 Pro Max)
- iPhone 5.5" (iPhone 8 Plus)

**Screenshot Suggestions:**
1. Category selection screen
2. Question 1 example
3. Question with options selected
4. Reflection output example
5. Feature highlights

**Tips:**
- Use simulator to capture screenshots
- Show realistic, relatable examples
- Ensure text is readable
- Demonstrate value clearly

### 4. App Review Information

**Contact Information:**
- First Name, Last Name
- Phone Number
- Email Address

**Demo Account:** Not required (no login)

**Notes:**
```
Decision Reflection is a privacy-first decision-making tool based on behavioral economics.

HOW TO TEST:
1. Select "Purchases" category
2. Answer any 5 questions (example: "wireless headphones")
3. View the personalized reflection

All data is stored locally. No network connections are made.

The app is designed to help users reflect on decisions before acting, based on research by Daniel Kahneman and other behavioral economists.
```

### 5. Build Archive

1. In Xcode, select **Any iOS Device** (not simulator)
2. **Product > Archive**
3. Wait for archive to complete
4. Click **Distribute App**
5. Select **App Store Connect**
6. Upload and submit for review

### 6. App Review Timeline

- Typical: 24-48 hours
- Can be longer during peak times
- Watch for status updates in App Store Connect
- Respond quickly to any rejection feedback

## Post-Launch

### Monitor
- App Store Connect Analytics
- Crash reports (Settings > Privacy & Security > Analytics > Share iPhone Analytics)
- User reviews and ratings
- Support email

### Iterate
- Respond to user feedback
- Fix critical bugs quickly
- Plan feature updates
- Consider additional categories

### Marketing
- Share on Twitter, LinkedIn
- Post to Product Hunt
- Write launch blog post
- Reach out to productivity/psychology bloggers

## Need Help?

- **Xcode Issues:** https://developer.apple.com/forums/
- **Swift Questions:** https://stackoverflow.com/questions/tagged/swift
- **SwiftUI Issues:** https://stackoverflow.com/questions/tagged/swiftui
- **App Store Review:** https://developer.apple.com/app-store/review/

## Next Steps

1. Complete project setup in Xcode
2. Test thoroughly on device
3. Gather beta tester feedback via TestFlight
4. Create App Store screenshots and metadata
5. Submit for review
6. Launch! 🚀
