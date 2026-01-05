//
//  ReflectionGenerator.swift
//  DecisionLean
//
//  Generates personalized Decision Lean output (5-block structure) based on user answers.
//  Grounded in behavioral economics without explicit theory references.
//

import Foundation

struct ReflectionGenerator {

    /// Generates a Decision Lean reflection from a completed session
    static func generate(from session: DecisionSession) -> ReflectionOutput {
        switch session.flow.category {
        case .purchases:
            return generatePurchases(session: session, flowType: session.flow.flowType)
        case .investments:
            return generateInvestments(session: session, flowType: session.flow.flowType)
        case .timeAndEnergy:
            return generateTimeEnergy(session: session, flowType: session.flow.flowType)
        case .experiences:
            return generateExperiences(session: session, flowType: session.flow.flowType)
        }
    }

    // MARK: - PURCHASES

    private static func generatePurchases(session: DecisionSession, flowType: FlowType) -> ReflectionOutput {
        switch flowType {
        case .reflectionFirst:
            return generatePurchasesFlowA(session)
        case .tradeoffFirst:
            return generatePurchasesFlowB(session)
        }
    }

    private static func generatePurchasesFlowA(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "purchases_a_q1")?.value ?? "this item"
        let timing = session.answer(for: "purchases_a_q2")?.value ?? ""
        let tradeoff = session.answer(for: "purchases_a_q3")?.value ?? ""
        let future = session.answer(for: "purchases_a_q4")?.value ?? ""
        let disappear = session.answer(for: "purchases_a_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if timing.contains("thinking about it for a while") {
            summary += ", something that's been on your mind for some time."
        } else if timing.contains("on sale") {
            summary += ", mainly driven by timing and current availability."
        } else if timing.contains("reacting to how I feel") {
            summary += " in response to how you're feeling right now."
        } else {
            summary += "."
        }

        // 2. Dominant Friction
        var friction = ""
        if timing.contains("on sale") || timing.contains("reacting") {
            friction = "Short-term urgency appears stronger than long-term value."
        } else if tradeoff.contains("haven't thought") || disappear.contains("not sure") {
            friction = "Opportunity cost neglect — the alternatives haven't been fully considered."
        } else if future.contains("barely used") || future.contains("regret") {
            friction = "Projection bias — anticipated future use may not match reality."
        } else {
            friction = "Present appeal versus future utility."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let urgentTiming = timing.contains("on sale") || timing.contains("reacting")
        let negativeFuture = future.contains("barely") || future.contains("regret")
        let wouldPass = disappear.contains("Do nothing")

        if negativeFuture && wouldPass {
            lean = DecisionLean(
                direction: "Lean toward waiting",
                explanation: "Your own signals suggest low future value and minimal loss if you pass."
            )
        } else if urgentTiming && negativeFuture {
            lean = DecisionLean(
                direction: "Lean toward reframing the purchase",
                explanation: "The timing feels urgent but your projection of future use is uncertain."
            )
        } else if !urgentTiming && future.contains("glad") {
            lean = DecisionLean(
                direction: "Lean toward acting now",
                explanation: "Your thinking has been deliberate and you anticipate positive long-term value."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward waiting",
                explanation: "The signals are mixed — giving this time may help clarify what you actually want."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if (urgentTiming && negativeFuture) || (wouldPass && negativeFuture) {
            confidence = .high
        } else if timing.contains("don't really know") || disappear.contains("not sure") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if confidence == .low {
            nextStep = "Revisiting this in a few days may give you a clearer read on what you actually want."
        } else if lean.direction.contains("waiting") {
            nextStep = "The option is still there. Seeing how you feel about it tomorrow can be clarifying."
        } else {
            nextStep = "If this still feels right after sleeping on it, that's additional signal."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    private static func generatePurchasesFlowB(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "purchases_b_q1")?.value ?? "this item"
        let cost = session.answer(for: "purchases_b_q2")?.value ?? ""
        let alternative = session.answer(for: "purchases_b_q3")?.value ?? ""
        let use = session.answer(for: "purchases_b_q4")?.value ?? ""
        let waiting = session.answer(for: "purchases_b_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if cost.contains("Much less") {
            summary += ", which costs notably less than usual for this type of item."
        } else if cost.contains("Much more") {
            summary += ", which represents a higher investment than you typically make in this category."
        } else {
            summary += " at a cost that feels about typical for you."
        }

        // 2. Dominant Friction
        var friction = ""
        if waiting.contains("opportunity would be gone") {
            friction = "Urgency illusion — scarcity is driving the timeline more than need."
        } else if alternative.contains("Haven't thought") {
            friction = "Opportunity cost neglect — what this money could become hasn't been explored."
        } else if use.contains("Rarely") && cost.contains("more") {
            friction = "Projection bias — expected use may not justify the investment."
        } else {
            friction = "Cost versus anticipated value."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let highCost = cost.contains("Much more") || cost.contains("More than usual")
        let lowUse = use.contains("Rarely") || use.contains("Occasionally")
        let stable = waiting.contains("Nothing would change")
        let dailyUse = use.contains("Daily")

        if dailyUse && !highCost {
            lean = DecisionLean(
                direction: "Lean toward acting now",
                explanation: "High expected use at a reasonable cost suggests solid value."
            )
        } else if lowUse && highCost {
            lean = DecisionLean(
                direction: "Lean toward reframing the purchase",
                explanation: "Low expected use at high cost points toward either waiting or reconsidering what you actually need."
            )
        } else if stable && (lowUse || alternative.contains("Haven't thought")) {
            lean = DecisionLean(
                direction: "Lean toward waiting",
                explanation: "The opportunity is stable and uncertainty remains about value or alternatives."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward waiting",
                explanation: "Taking time to clarify expected use and opportunity cost may shift your perspective."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if (dailyUse && !highCost) || (lowUse && highCost) {
            confidence = .high
        } else if alternative.contains("Haven't thought") || use.contains("not sure") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("reframing") {
            nextStep = "Exploring what need this actually addresses might reveal a better solution."
        } else if confidence == .low {
            nextStep = "Thinking through what else this money could become may clarify the trade-off."
        } else {
            nextStep = "Checking back in a week can reveal whether interest fades or strengthens."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    // MARK: - INVESTMENTS

    private static func generateInvestments(session: DecisionSession, flowType: FlowType) -> ReflectionOutput {
        switch flowType {
        case .reflectionFirst:
            return generateInvestmentsFlowA(session)
        case .tradeoffFirst:
            return generateInvestmentsFlowB(session)
        }
    }

    private static func generateInvestmentsFlowA(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "investments_a_q1")?.value ?? "this financial decision"
        let understanding = session.answer(for: "investments_a_q2")?.value ?? ""
        let downside = session.answer(for: "investments_a_q3")?.value ?? ""
        let timing = session.answer(for: "investments_a_q4")?.value ?? ""
        let blame = session.answer(for: "investments_a_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if understanding.contains("thoroughly") {
            summary += ", based on research you've done."
        } else if understanding.contains("basics") {
            summary += ", with a general but not deep understanding."
        } else if understanding.contains("someone else") {
            summary += ", primarily based on someone else's recommendation."
        } else {
            summary += " without full clarity on the details."
        }

        // 2. Dominant Friction
        var friction = ""
        if timing.contains("missing out") || timing.contains("Recent market") {
            friction = "Recency bias — recent events are weighing heavily on the decision."
        } else if understanding.contains("not entirely") || understanding.contains("someone else") {
            friction = "Overconfidence — acting without full understanding of the risks."
        } else if downside.contains("set me back") && timing.contains("missing out") {
            friction = "Loss aversion versus FOMO — fear is driving from both directions."
        } else {
            friction = "Confidence level versus risk tolerance."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let weakUnderstanding = understanding.contains("someone else") || understanding.contains("not entirely")
        let severeDownside = downside.contains("set me back")
        let fomo = timing.contains("missing out") || timing.contains("Recent market")
        let planned = timing.contains("planning this for a while")

        if weakUnderstanding || severeDownside {
            lean = DecisionLean(
                direction: "Lean toward caution",
                explanation: "The combination of uncertainty and meaningful downside suggests slowing down."
            )
        } else if fomo && !planned {
            lean = DecisionLean(
                direction: "Lean toward smaller exposure",
                explanation: "Recent urgency combined with market timing suggests testing with less capital first."
            )
        } else if planned && downside.contains("can afford to lose") {
            lean = DecisionLean(
                direction: "Lean toward acting deliberately",
                explanation: "You've thought this through and the downside is manageable within your risk tolerance."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward caution",
                explanation: "Mixed signals suggest taking time to clarify understanding before committing capital."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if weakUnderstanding || downside.contains("haven't thought") {
            confidence = .low
        } else if severeDownside && fomo {
            confidence = .high
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("caution") {
            nextStep = "Waiting until you can articulate the risks clearly may prevent regrettable outcomes."
        } else if lean.direction.contains("smaller exposure") {
            nextStep = "Testing with a fraction of what you're considering lets you learn with limited downside."
        } else {
            nextStep = "Checking your reasoning with someone who'll challenge it can surface blind spots."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    private static func generateInvestmentsFlowB(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "investments_b_q1")?.value ?? "this investment"
        let portion = session.answer(for: "investments_b_q2")?.value ?? ""
        let regret = session.answer(for: "investments_b_q3")?.value ?? ""
        let worst = session.answer(for: "investments_b_q4")?.value ?? ""
        let wait = session.answer(for: "investments_b_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if portion.contains("small percentage") {
            summary += ", representing a small portion of your available capital."
        } else if portion.contains("meaningful") {
            summary += ", which would be a meaningful portion of your available funds."
        } else if portion.contains("Most of it") {
            summary += ", which represents most of your available money."
        } else {
            summary += ", using more capital than you currently have."
        }

        // 2. Dominant Friction
        var friction = ""
        if regret.contains("Not acting and missing") {
            friction = "Outcome bias — fear of missing gains is dominating fear of loss."
        } else if worst.contains("most or all") && portion.contains("meaningful") {
            friction = "Loss aversion failure — potential loss is severe but not fully weighted."
        } else if wait.contains("anxious") {
            friction = "Present bias — waiting feels harder than it objectively is."
        } else {
            friction = "Regret asymmetry between action and inaction."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let highRisk = worst.contains("significant") || worst.contains("most or all")
        let largePortion = portion.contains("meaningful") || portion.contains("Most")
        let fearOfMissing = regret.contains("Not acting")
        let canWait = wait.contains("wouldn't matter")

        if highRisk && largePortion {
            lean = DecisionLean(
                direction: "Lean toward smaller exposure",
                explanation: "The combination of high risk and large portion suggests reducing the amount you're considering."
            )
        } else if fearOfMissing && highRisk {
            lean = DecisionLean(
                direction: "Lean toward caution",
                explanation: "Fear of missing out is present alongside meaningful downside risk."
            )
        } else if canWait && (highRisk || largePortion) {
            lean = DecisionLean(
                direction: "Lean toward acting deliberately",
                explanation: "The option is stable. Taking time to clarify conviction may improve the decision."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward smaller exposure",
                explanation: "Testing with less capital first preserves optionality while letting you learn."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if highRisk && largePortion && fearOfMissing {
            confidence = .high
        } else if worst.contains("not certain") || wait.contains("not sure") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("smaller exposure") {
            nextStep = "Committing a fraction of what you're considering lets you participate without overexposure."
        } else if confidence == .low {
            nextStep = "Clarifying the worst realistic outcome and whether you can absorb it may shift your comfort level."
        } else {
            nextStep = "Waiting to see if urgency fades can reveal how much of this is conviction versus impulse."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    // MARK: - TIME & ENERGY

    private static func generateTimeEnergy(session: DecisionSession, flowType: FlowType) -> ReflectionOutput {
        switch flowType {
        case .reflectionFirst:
            return generateTimeEnergyFlowA(session)
        case .tradeoffFirst:
            return generateTimeEnergyFlowB(session)
        }
    }

    private static func generateTimeEnergyFlowA(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "time_a_q1")?.value ?? "this commitment"
        let hours = session.answer(for: "time_a_q2")?.value ?? ""
        let capacity = session.answer(for: "time_a_q3")?.value ?? ""
        let replacement = session.answer(for: "time_a_q4")?.value ?? ""
        let exit = session.answer(for: "time_a_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if hours.contains("not entirely sure") {
            summary += ", though the time commitment isn't fully clear."
        } else if hours.contains("6-10") {
            summary += ", which would require substantial weekly time."
        } else {
            summary += ", which would take \(hours.lowercased()) per week."
        }

        // 2. Dominant Friction
        var friction = ""
        if capacity.contains("stretched") || capacity.contains("overwhelmed") {
            friction = "Planning fallacy — adding more when already at capacity."
        } else if replacement.contains("haven't thought") {
            friction = "Optimism bias — assuming time will appear without identifying the source."
        } else if exit.contains("Difficult") && capacity.contains("stretched") {
            friction = "Sunk cost risk — hard to exit while already overcommitted."
        } else {
            friction = "Capacity realism versus commitment enthusiasm."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let overCapacity = capacity.contains("stretched") || capacity.contains("overwhelmed")
        let hardExit = exit.contains("Difficult") || exit.contains("not sure")
        let hasRoom = capacity.contains("room for more")
        let easyExit = exit.contains("Very easy")

        if overCapacity && hardExit {
            lean = DecisionLean(
                direction: "Lean toward saying no",
                explanation: "You're already stretched and this would be difficult to exit if it becomes too much."
            )
        } else if overCapacity || replacement.contains("haven't thought") {
            lean = DecisionLean(
                direction: "Lean toward renegotiating scope",
                explanation: "There may be a smaller version of this that fits your actual capacity."
            )
        } else if hasRoom && easyExit {
            lean = DecisionLean(
                direction: "Lean toward committing deliberately",
                explanation: "You have capacity and the exit cost is low if circumstances change."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward saying no",
                explanation: "Mixed signals about capacity and exit difficulty suggest caution."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if (overCapacity && hardExit) || (hasRoom && easyExit) {
            confidence = .high
        } else if hours.contains("not entirely") || replacement.contains("haven't thought") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("saying no") {
            nextStep = "Saying no now preserves your capacity for things that might matter more later."
        } else if lean.direction.contains("renegotiating") {
            nextStep = "Asking whether a smaller commitment is possible may create a version that actually works."
        } else {
            nextStep = "Checking in a week on whether this still feels like the right use of time can be clarifying."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    private static func generateTimeEnergyFlowB(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "time_b_q1")?.value ?? "this commitment"
        let duration = session.answer(for: "time_b_q2")?.value ?? ""
        let exit = session.answer(for: "time_b_q3")?.value ?? ""
        let why = session.answer(for: "time_b_q4")?.value ?? ""
        let future = session.answer(for: "time_b_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if duration.contains("Indefinite") {
            summary += ", with no clear endpoint."
        } else if duration.contains("year") {
            summary += ", which would extend for six months to a year."
        } else {
            summary += ", expected to last \(duration.lowercased())."
        }

        // 2. Dominant Friction
        var friction = ""
        if why.contains("feel like I should") {
            friction = "Obligation versus genuine interest."
        } else if exit.contains("locked in") && duration.contains("Indefinite") {
            friction = "Sunk cost trap — difficult to exit an open-ended commitment."
        } else if future.contains("wish I'd said no") {
            friction = "Projection awareness — you're already sensing future regret."
        } else {
            friction = "Present social pressure versus future capacity reality."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let hardExit = exit.contains("let people down") || exit.contains("locked in")
        let obligation = why.contains("should") || why.contains("not entirely")
        let futureRegret = future.contains("wish I'd said no")
        let aligned = why.contains("aligns with what I want")

        if futureRegret {
            lean = DecisionLean(
                direction: "Lean toward saying no",
                explanation: "You're already projecting regret. That signal is worth taking seriously."
            )
        } else if hardExit && (obligation || duration.contains("Indefinite")) {
            lean = DecisionLean(
                direction: "Lean toward renegotiating scope",
                explanation: "The exit cost is high. A more bounded version might work better."
            )
        } else if aligned && !hardExit {
            lean = DecisionLean(
                direction: "Lean toward committing deliberately",
                explanation: "This aligns with your goals and the exit path is manageable if needed."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward saying no",
                explanation: "Uncertainty about motivation combined with commitment depth suggests pause."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if futureRegret || (aligned && !hardExit) {
            confidence = .high
        } else if why.contains("not entirely") || future.contains("Hard to predict") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("saying no") {
            nextStep = "Declining now prevents future resentment and preserves relationships better than dropping out later."
        } else if lean.direction.contains("renegotiating") {
            nextStep = "Proposing a specific, bounded version may get you the upside without the indefinite burden."
        } else {
            nextStep = "Imagining yourself three months in can reveal whether this feels sustainable."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    // MARK: - EXPERIENCES

    private static func generateExperiences(session: DecisionSession, flowType: FlowType) -> ReflectionOutput {
        switch flowType {
        case .reflectionFirst:
            return generateExperiencesFlowA(session)
        case .tradeoffFirst:
            return generateExperiencesFlowB(session)
        }
    }

    private static func generateExperiencesFlowA(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "experiences_a_q1")?.value ?? "this experience"
        let appeal = session.answer(for: "experiences_a_q2")?.value ?? ""
        let memory = session.answer(for: "experiences_a_q3")?.value ?? ""
        let tradeoff = session.answer(for: "experiences_a_q4")?.value ?? ""
        let unavailable = session.answer(for: "experiences_a_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if appeal.contains("wanted to do this for a while") {
            summary += ", something you've been interested in for some time."
        } else if appeal.contains("time-limited") {
            summary += ", drawn by its limited availability."
        } else if appeal.contains("Others are going") {
            summary += ", with social factors playing a role."
        } else {
            summary += " because it sounds appealing."
        }

        // 2. Dominant Friction
        var friction = ""
        if appeal.contains("time-limited") || appeal.contains("Others") {
            friction = "Affect heuristic — immediate emotion is driving more than lasting value."
        } else if memory.contains("Barely") && tradeoff.contains("Money") {
            friction = "Memory bias — anticipated recall value may not match cost."
        } else if unavailable.contains("relieved") {
            friction = "Social proof versus intrinsic desire."
        } else {
            friction = "Present excitement versus future recall value."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let strongMemory = memory.contains("Vividly")
        let weakMemory = memory.contains("Barely")
        let wouldBeRelieved = unavailable.contains("relieved")
        let genuinelyDisappointed = unavailable.contains("Genuinely disappointed")
        let longHeld = appeal.contains("wanted to do this for a while")

        if wouldBeRelieved {
            lean = DecisionLean(
                direction: "Lean toward letting it pass",
                explanation: "Relief at it being unavailable suggests this isn't what you actually want."
            )
        } else if weakMemory && !longHeld {
            lean = DecisionLean(
                direction: "Lean toward simplifying",
                explanation: "Low anticipated recall value suggests a smaller version might deliver similar benefit."
            )
        } else if strongMemory && genuinelyDisappointed && longHeld {
            lean = DecisionLean(
                direction: "Lean toward acting now",
                explanation: "High anticipated value, genuine desire, and long-term interest align toward going."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward letting it pass",
                explanation: "Mixed signals about lasting value and genuine interest suggest caution."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if wouldBeRelieved || (strongMemory && genuinelyDisappointed) {
            confidence = .high
        } else if unavailable.contains("not sure") || memory.contains("Hard to say") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("letting it pass") {
            nextStep = "Passing on this preserves resources for experiences that generate genuine enthusiasm."
        } else if lean.direction.contains("simplifying") {
            nextStep = "Exploring a less expensive or elaborate version may capture the core value with less commitment."
        } else {
            nextStep = "If this still feels compelling after a few days, that's additional signal about genuine interest."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }

    private static func generateExperiencesFlowB(_ session: DecisionSession) -> ReflectionOutput {
        let item = session.answer(for: "experiences_b_q1")?.value ?? "this experience"
        let ifAlone = session.answer(for: "experiences_b_q2")?.value ?? ""
        let social = session.answer(for: "experiences_b_q3")?.value ?? ""
        let cost = session.answer(for: "experiences_b_q4")?.value ?? ""
        let simpler = session.answer(for: "experiences_b_q5")?.value ?? ""

        // 1. Neutral Summary
        var summary = "You're considering \(item.lowercased())"
        if cost.contains("Low") {
            summary += ", with a low total cost across money, time, and energy."
        } else if cost.contains("Moderate") {
            summary += ", which represents a moderate but manageable investment."
        } else if cost.contains("Genuinely stretching") {
            summary += ", which would genuinely stretch your available resources."
        } else {
            summary += " at a cost that feels significant but possibly worthwhile."
        }

        // 2. Dominant Friction
        var friction = ""
        if social.contains("whole point") && ifAlone.contains("skip") {
            friction = "Social proof — the decision is driven by others rather than intrinsic interest."
        } else if cost.contains("stretching") && simpler.contains("prefer that") {
            friction = "Present versus future self — overspending now for an experience a simpler version would satisfy."
        } else if ifAlone.contains("not sure") {
            friction = "Unclear intrinsic motivation."
        } else {
            friction = "Social value versus total cost."
        }

        // 3. Decision Lean
        var lean: DecisionLean
        let sociallyDriven = social.contains("whole point") && ifAlone.contains("skip")
        let preferSimpler = simpler.contains("prefer that")
        let highCost = cost.contains("High") || cost.contains("stretching")
        let lowCost = cost.contains("Low")
        let stillGo = ifAlone.contains("Still definitely")

        if preferSimpler {
            lean = DecisionLean(
                direction: "Lean toward simplifying",
                explanation: "You've identified a version you'd actually prefer that costs less."
            )
        } else if sociallyDriven && highCost {
            lean = DecisionLean(
                direction: "Lean toward letting it pass",
                explanation: "High cost driven primarily by social factors rather than personal desire."
            )
        } else if stillGo && (lowCost || !highCost) {
            lean = DecisionLean(
                direction: "Lean toward acting now",
                explanation: "Genuine intrinsic interest at manageable cost suggests solid value."
            )
        } else {
            lean = DecisionLean(
                direction: "Lean toward simplifying",
                explanation: "Finding a less resource-intensive version may preserve the core value."
            )
        }

        // 4. Confidence Band
        let confidence: ConfidenceBand
        if preferSimpler || (stillGo && lowCost) || sociallyDriven {
            confidence = .high
        } else if ifAlone.contains("not sure") || simpler.contains("haven't considered") {
            confidence = .low
        } else {
            confidence = .medium
        }

        // 5. Soft Next Step
        let nextStep: String
        if lean.direction.contains("simplifying") {
            nextStep = "Identifying what you'd actually remember a year from now may reveal what the core experience really is."
        } else if lean.direction.contains("letting it pass") {
            nextStep = "Declining this preserves resources for experiences driven by genuine personal interest."
        } else {
            nextStep = "Imagining yourself right after it ends can reveal whether this is about the experience or the idea of it."
        }

        return ReflectionOutput(
            sessionId: session.id,
            neutralSummary: summary,
            dominantFriction: friction,
            decisionLean: lean,
            confidenceBand: confidence,
            softNextStep: nextStep
        )
    }
}
