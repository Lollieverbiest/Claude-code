//
//  FlowDefinitions.swift
//  DecisionReflection
//
//  Defines all decision flows for each category.
//

import Foundation

struct FlowDefinitions {

    // MARK: - Purchases Category Flows

    static let purchasesFlowA = DecisionFlow(
        category: .purchases,
        flowType: .reflectionFirst,
        name: "Reflection-First",
        description: "An introspective approach to purchase decisions",
        questions: [
            Question(
                id: "purchases_a_q1",
                text: "What are you considering buying?",
                type: .freeText,
                placeholder: "e.g., noise-canceling headphones"
            ),
            Question(
                id: "purchases_a_q2",
                text: "Why does this feel like the right moment?",
                type: .singleChoice,
                options: [
                    "I've been thinking about it for a while",
                    "It's on sale or feels limited",
                    "I'm reacting to how I feel right now",
                    "I don't really know"
                ]
            ),
            Question(
                id: "purchases_a_q3",
                text: "If you buy this, what are you not choosing?",
                type: .singleChoice,
                options: [
                    "Saving the money",
                    "Another purchase",
                    "Less clutter or mental space",
                    "Something else"
                ]
            ),
            Question(
                id: "purchases_a_q4",
                text: "Imagine yourself 30 days from now. What feels most likely?",
                type: .singleChoice,
                options: [
                    "I'm glad I bought it",
                    "I feel neutral about it",
                    "I barely used it",
                    "I slightly regret it"
                ]
            ),
            Question(
                id: "purchases_a_q5",
                text: "If this disappeared tomorrow, what would you most likely do?",
                type: .singleChoice,
                options: [
                    "Buy an alternative",
                    "Do nothing and move on",
                    "Revisit it later",
                    "Feel annoyed or frustrated"
                ]
            )
        ]
    )

    static let purchasesFlowB = DecisionFlow(
        category: .purchases,
        flowType: .tradeoffFirst,
        name: "Trade-off-First",
        description: "A decision economics approach to purchases",
        questions: [
            Question(
                id: "purchases_b_q1",
                text: "What are you thinking of buying?",
                type: .freeText,
                placeholder: "e.g., smart watch"
            ),
            Question(
                id: "purchases_b_q2",
                text: "How does the cost compare to what you'd normally spend on this type of thing?",
                type: .singleChoice,
                options: [
                    "Much less than usual",
                    "About typical",
                    "More than usual",
                    "Much more than usual"
                ]
            ),
            Question(
                id: "purchases_b_q3",
                text: "What else could this money become?",
                type: .singleChoice,
                options: [
                    "Saved for something specific",
                    "Added to general savings",
                    "Spent on a different priority",
                    "Haven't thought about it"
                ]
            ),
            Question(
                id: "purchases_b_q4",
                text: "How often do you expect to use this in the next month?",
                type: .singleChoice,
                options: [
                    "Daily or almost daily",
                    "A few times a week",
                    "Occasionally",
                    "Rarely or never"
                ]
            ),
            Question(
                id: "purchases_b_q5",
                text: "What would happen if you waited a week?",
                type: .singleChoice,
                options: [
                    "The opportunity would be gone",
                    "The price might change",
                    "My interest might fade",
                    "Nothing would change"
                ]
            )
        ]
    )

    // MARK: - Flow Registry

    static func flows(for category: DecisionCategory) -> [DecisionFlow] {
        switch category {
        case .purchases:
            return [purchasesFlowA, purchasesFlowB]
        case .investments, .timeAndEnergy, .experiences:
            // Placeholder for future categories
            return []
        }
    }

    static func randomFlow(for category: DecisionCategory) -> DecisionFlow? {
        flows(for: category).randomElement()
    }
}
