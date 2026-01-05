//
//  FlowDefinitions.swift
//  DecisionLean
//
//  Defines all decision flows for each category (8 total: 4 categories × 2 flows).
//

import Foundation

struct FlowDefinitions {

    // MARK: - PURCHASES (Consumer goods, subscriptions, gadgets)

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
                    "I'm not sure"
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

    // MARK: - INVESTMENTS (Financial decisions)

    static let investmentsFlowA = DecisionFlow(
        category: .investments,
        flowType: .reflectionFirst,
        name: "Confidence Stress-Test",
        description: "Evidence-based approach to financial decisions",
        questions: [
            Question(
                id: "investments_a_q1",
                text: "What financial decision are you considering?",
                type: .freeText,
                placeholder: "e.g., buying cryptocurrency, changing funds"
            ),
            Question(
                id: "investments_a_q2",
                text: "How would you describe your understanding of this?",
                type: .singleChoice,
                options: [
                    "I've researched this thoroughly",
                    "I understand the basics",
                    "I'm relying on someone else's advice",
                    "I'm not entirely sure"
                ]
            ),
            Question(
                id: "investments_a_q3",
                text: "What happens if you're wrong about this?",
                type: .singleChoice,
                options: [
                    "I'd lose money I can afford to lose",
                    "I'd regret it but recover",
                    "It would meaningfully set me back",
                    "I haven't thought about it"
                ]
            ),
            Question(
                id: "investments_a_q4",
                text: "What's driving the timing of this?",
                type: .singleChoice,
                options: [
                    "I've been planning this for a while",
                    "Recent market movement",
                    "Someone recommended it now",
                    "I feel like I'm missing out"
                ]
            ),
            Question(
                id: "investments_a_q5",
                text: "If this goes poorly, what would you think?",
                type: .singleChoice,
                options: [
                    "That's part of the risk",
                    "I'd feel frustrated but move on",
                    "I'd blame myself",
                    "I'm not sure"
                ]
            )
        ]
    )

    static let investmentsFlowB = DecisionFlow(
        category: .investments,
        flowType: .tradeoffFirst,
        name: "Downside Framing",
        description: "Regret asymmetry and risk focus",
        questions: [
            Question(
                id: "investments_b_q1",
                text: "What are you thinking of doing with your money?",
                type: .freeText,
                placeholder: "e.g., invest in index funds, buy stock"
            ),
            Question(
                id: "investments_b_q2",
                text: "How much of your available money would this represent?",
                type: .singleChoice,
                options: [
                    "A small percentage",
                    "A meaningful portion",
                    "Most of it",
                    "More than I currently have"
                ]
            ),
            Question(
                id: "investments_b_q3",
                text: "Which would feel worse?",
                type: .singleChoice,
                options: [
                    "Acting now and losing",
                    "Not acting and missing gains",
                    "About the same",
                    "Hard to say"
                ]
            ),
            Question(
                id: "investments_b_q4",
                text: "What's the worst realistic outcome here?",
                type: .singleChoice,
                options: [
                    "I lose a small amount",
                    "I lose a significant amount",
                    "I lose most or all of it",
                    "I'm not certain"
                ]
            ),
            Question(
                id: "investments_b_q5",
                text: "Could you wait a month to decide?",
                type: .singleChoice,
                options: [
                    "Yes, and it wouldn't matter",
                    "Yes, but I'd feel anxious",
                    "No, the window closes soon",
                    "I'm not sure"
                ]
            )
        ]
    )

    // MARK: - TIME & ENERGY (Commitments)

    static let timeEnergyFlowA = DecisionFlow(
        category: .timeAndEnergy,
        flowType: .reflectionFirst,
        name: "Capacity Realism",
        description: "Testing actual availability",
        questions: [
            Question(
                id: "time_a_q1",
                text: "What commitment are you considering?",
                type: .freeText,
                placeholder: "e.g., joining a board, volunteering weekly"
            ),
            Question(
                id: "time_a_q2",
                text: "How much time would this realistically take per week?",
                type: .singleChoice,
                options: [
                    "1-2 hours",
                    "3-5 hours",
                    "6-10 hours",
                    "I'm not entirely sure"
                ]
            ),
            Question(
                id: "time_a_q3",
                text: "When you think about your current week, how does it feel?",
                type: .singleChoice,
                options: [
                    "I have room for more",
                    "I'm at capacity but managing",
                    "I'm already stretched",
                    "I'm overwhelmed"
                ]
            ),
            Question(
                id: "time_a_q4",
                text: "What would you stop doing to make room for this?",
                type: .singleChoice,
                options: [
                    "Something specific I'd gladly drop",
                    "Rest or downtime",
                    "Something important I'd have to cut",
                    "I haven't thought about it"
                ]
            ),
            Question(
                id: "time_a_q5",
                text: "How easy would it be to exit this later if needed?",
                type: .singleChoice,
                options: [
                    "Very easy, low stakes",
                    "Possible but awkward",
                    "Difficult or complicated",
                    "I'm not sure"
                ]
            )
        ]
    )

    static let timeEnergyFlowB = DecisionFlow(
        category: .timeAndEnergy,
        flowType: .tradeoffFirst,
        name: "Exit-Cost Awareness",
        description: "Understanding commitment depth",
        questions: [
            Question(
                id: "time_b_q1",
                text: "What are you thinking of saying yes to?",
                type: .freeText,
                placeholder: "e.g., coaching a team, taking on a project"
            ),
            Question(
                id: "time_b_q2",
                text: "What's the expected duration of this?",
                type: .singleChoice,
                options: [
                    "A few weeks or less",
                    "A few months",
                    "Six months to a year",
                    "Indefinite or unclear"
                ]
            ),
            Question(
                id: "time_b_q3",
                text: "If you needed to step back in a month, what would happen?",
                type: .singleChoice,
                options: [
                    "No problem, easy to exit",
                    "Awkward but manageable",
                    "It would let people down",
                    "I'd be locked in"
                ]
            ),
            Question(
                id: "time_b_q4",
                text: "Why are you considering this now?",
                type: .singleChoice,
                options: [
                    "It aligns with what I want",
                    "Someone asked and I want to help",
                    "I feel like I should",
                    "I'm not entirely sure"
                ]
            ),
            Question(
                id: "time_b_q5",
                text: "Six months from now, how would you feel about this?",
                type: .singleChoice,
                options: [
                    "Glad I committed",
                    "It would feel neutral",
                    "I'd wish I'd said no",
                    "Hard to predict"
                ]
            )
        ]
    )

    // MARK: - EXPERIENCES (Travel, events, adventures)

    static let experiencesFlowA = DecisionFlow(
        category: .experiences,
        flowType: .reflectionFirst,
        name: "Memory Realism",
        description: "Testing future recall value",
        questions: [
            Question(
                id: "experiences_a_q1",
                text: "What experience are you considering?",
                type: .freeText,
                placeholder: "e.g., concert tickets, weekend trip"
            ),
            Question(
                id: "experiences_a_q2",
                text: "What's making this feel appealing right now?",
                type: .singleChoice,
                options: [
                    "I've wanted to do this for a while",
                    "It's time-limited or exclusive",
                    "Others are going",
                    "It just sounds fun"
                ]
            ),
            Question(
                id: "experiences_a_q3",
                text: "A year from now, how much do you think you'd remember this?",
                type: .singleChoice,
                options: [
                    "Vividly and often",
                    "Occasionally with fondness",
                    "Barely or not at all",
                    "Hard to say"
                ]
            ),
            Question(
                id: "experiences_a_q4",
                text: "What would you be giving up to do this?",
                type: .singleChoice,
                options: [
                    "Money I'd otherwise save",
                    "Time I'd spend on something else",
                    "Rest or recovery",
                    "I haven't thought about it"
                ]
            ),
            Question(
                id: "experiences_a_q5",
                text: "If this weren't available, what would you feel?",
                type: .singleChoice,
                options: [
                    "Genuinely disappointed",
                    "A little bummed but fine",
                    "Mostly relieved",
                    "I'm not sure"
                ]
            )
        ]
    )

    static let experiencesFlowB = DecisionFlow(
        category: .experiences,
        flowType: .tradeoffFirst,
        name: "Social-Pressure Removal",
        description: "Isolating intrinsic motivation",
        questions: [
            Question(
                id: "experiences_b_q1",
                text: "What are you thinking of doing?",
                type: .freeText,
                placeholder: "e.g., destination wedding, festival"
            ),
            Question(
                id: "experiences_b_q2",
                text: "If no one else knew about your decision, what would you do?",
                type: .singleChoice,
                options: [
                    "Still definitely go",
                    "Probably still go",
                    "Probably skip it",
                    "I'm not sure"
                ]
            ),
            Question(
                id: "experiences_b_q3",
                text: "How much does the social element matter?",
                type: .singleChoice,
                options: [
                    "It's the whole point",
                    "It adds a lot of value",
                    "It's secondary",
                    "Not much at all"
                ]
            ),
            Question(
                id: "experiences_b_q4",
                text: "What's the total cost — money, time, and energy?",
                type: .singleChoice,
                options: [
                    "Low, easy to absorb",
                    "Moderate but manageable",
                    "High but possibly worth it",
                    "Genuinely stretching"
                ]
            ),
            Question(
                id: "experiences_b_q5",
                text: "Could you do a simpler version of this?",
                type: .singleChoice,
                options: [
                    "Yes, and I'd prefer that",
                    "Yes, but it wouldn't be the same",
                    "Not really",
                    "I haven't considered it"
                ]
            )
        ]
    )

    // MARK: - Flow Registry

    static func flows(for category: DecisionCategory) -> [DecisionFlow] {
        switch category {
        case .purchases:
            return [purchasesFlowA, purchasesFlowB]
        case .investments:
            return [investmentsFlowA, investmentsFlowB]
        case .timeAndEnergy:
            return [timeEnergyFlowA, timeEnergyFlowB]
        case .experiences:
            return [experiencesFlowA, experiencesFlowB]
        }
    }

    static func randomFlow(for category: DecisionCategory) -> DecisionFlow? {
        flows(for: category).randomElement()
    }
}
