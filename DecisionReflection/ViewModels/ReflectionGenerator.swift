//
//  ReflectionGenerator.swift
//  DecisionReflection
//
//  Generates personalized, non-judgmental reflection output based on user answers.
//

import Foundation

struct ReflectionGenerator {

    /// Generates a reflection output from a completed decision session
    static func generate(from session: DecisionSession) -> ReflectionOutput {
        let answers = session.answers
        let flow = session.flow

        switch flow.category {
        case .purchases:
            return generatePurchasesReflection(session: session, flowType: flow.flowType)
        default:
            return generateGenericReflection(session: session)
        }
    }

    // MARK: - Purchases Reflections

    private static func generatePurchasesReflection(session: DecisionSession, flowType: FlowType) -> ReflectionOutput {
        switch flowType {
        case .reflectionFirst:
            return generatePurchasesFlowA(session: session)
        case .tradeoffFirst:
            return generatePurchasesFlowB(session: session)
        }
    }

    // MARK: - Flow A (Reflection-First)

    private static func generatePurchasesFlowA(session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "purchases_a_q1")?.value ?? "this item"
        let timing = session.answer(for: "purchases_a_q2")?.value ?? ""
        let tradeoff = session.answer(for: "purchases_a_q3")?.value ?? ""
        let futureFeeling = session.answer(for: "purchases_a_q4")?.value ?? ""
        let disappearance = session.answer(for: "purchases_a_q5")?.value ?? ""

        // Neutral Summary
        var summary = "You're considering buying \(item.lowercased())"
        if timing.contains("thinking about it for a while") {
            summary += ", something that's been on your mind for some time."
        } else if timing.contains("on sale") {
            summary += ", mainly driven by timing and current availability."
        } else if timing.contains("reacting to how I feel") {
            summary += " in response to how you're feeling right now."
        } else {
            summary += "."
        }

        // Trade-off Spotlight
        var spotlight = ""
        if tradeoff.contains("Saving the money") {
            spotlight = "Choosing this likely means setting aside the option to save this money for now."
        } else if tradeoff.contains("Another purchase") {
            spotlight = "Making this purchase creates a trade-off with other things you might buy."
        } else if tradeoff.contains("clutter") {
            spotlight = "Adding this to your life exchanges money for physical or mental presence."
        } else {
            spotlight = "Every choice to acquire something involves exchanging it for other possibilities."
        }

        // Future-Oriented Reflection
        var future = ""
        if futureFeeling.contains("glad") {
            future = "You anticipate positive feelings about this. Purchases that meet ongoing needs tend to maintain their value over time."
        } else if futureFeeling.contains("neutral") {
            future = "You expect this to feel neutral later. Many decisions that feel significant now settle into the background of daily life."
        } else if futureFeeling.contains("barely used") {
            future = "You're noticing uncertainty about future use. Items often receive different amounts of attention than we initially imagine."
        } else if futureFeeling.contains("regret") {
            future = "You're sensing potential regret. This awareness itself is information about the decision."
        } else {
            future = "Decisions like this often feel more neutral over time than they do in the moment."
        }

        // Soft Pause
        var pause: String? = nil
        if disappearance.contains("Do nothing") || timing.contains("don't really know") {
            pause = "You don't need to decide right now. Revisiting this later may give you a clearer signal."
        } else if futureFeeling.contains("barely used") || futureFeeling.contains("regret") {
            pause = "The decision is still available to you. Waiting doesn't close the door."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            tradeoffSpotlight: spotlight,
            futureReflection: future,
            softPause: pause
        )
    }

    // MARK: - Flow B (Trade-off-First)

    private static func generatePurchasesFlowB(session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "purchases_b_q1")?.value ?? "this item"
        let costComparison = session.answer(for: "purchases_b_q2")?.value ?? ""
        let alternative = session.answer(for: "purchases_b_q3")?.value ?? ""
        let expectedUse = session.answer(for: "purchases_b_q4")?.value ?? ""
        let waiting = session.answer(for: "purchases_b_q5")?.value ?? ""

        // Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if costComparison.contains("Much less") {
            summary += ", which costs notably less than you'd typically spend on this type of item."
        } else if costComparison.contains("Much more") {
            summary += ", which represents a higher investment than you'd usually make in this category."
        } else if costComparison.contains("More than usual") {
            summary += " at a cost that's somewhat higher than your typical spending for this type of thing."
        } else {
            summary += " at a price point that feels about typical for you."
        }

        // Trade-off Spotlight
        var spotlight = ""
        if alternative.contains("something specific") {
            spotlight = "This money currently has another destination in mind. Choosing this changes what's available for that specific goal."
        } else if alternative.contains("general savings") {
            spotlight = "This represents funds that would otherwise remain in reserve, available for future unknowns."
        } else if alternative.contains("different priority") {
            spotlight = "You're weighing this against another way to allocate these resources."
        } else {
            spotlight = "The opportunity cost here hasn't been fully explored yet. Money spent here becomes unavailable elsewhere."
        }

        // Future-Oriented Reflection
        var future = ""
        if expectedUse.contains("Daily") {
            future = "You expect this to integrate into your routine. Items used frequently tend to justify their presence over time."
        } else if expectedUse.contains("few times a week") {
            future = "You anticipate regular but not constant use. Most purchases receive less attention than initially expected."
        } else if expectedUse.contains("Occasionally") || expectedUse.contains("Rarely") {
            future = "You're noticing limited expected use. Infrequent engagement often means the value lives more in ownership than in active use."
        } else {
            future = "Actual use patterns often differ from initial expectations, usually declining over time."
        }

        // Soft Pause
        var pause: String? = nil
        if waiting.contains("interest might fade") {
            pause = "Your own signal suggests time could clarify this. The impulse itself may contain information."
        } else if waiting.contains("Nothing would change") {
            pause = "The option remains stable. Delayed decisions about stable opportunities rarely become worse."
        } else if alternative.contains("Haven't thought about it") || expectedUse.contains("Rarely") {
            pause = "Taking time to consider the full picture may reveal details that aren't obvious in the moment."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            tradeoffSpotlight: spotlight,
            futureReflection: future,
            softPause: pause
        )
    }

    // MARK: - Generic Fallback

    private static func generateGenericReflection(session: DecisionSession) -> ReflectionOutput {
        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: "You've completed a reflection on this decision.",
            tradeoffSpotlight: "Every choice involves trade-offs between different possibilities.",
            futureReflection: "How this feels now may differ from how it feels over time.",
            softPause: "The choice remains available to you."
        )
    }
}
