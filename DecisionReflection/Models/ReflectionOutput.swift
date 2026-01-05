//
//  ReflectionOutput.swift
//  DecisionLean
//
//  Model for the Decision Lean output shown after completing a decision flow.
//

import Foundation

enum ConfidenceBand: String, Codable {
    case low = "Low confidence — revisit later"
    case medium = "Medium confidence — pause recommended"
    case high = "High confidence — internally consistent"
}

struct ReflectionOutput: Codable, Identifiable {
    let id: String
    let sessionId: String

    // 5-block output structure (mandatory)
    let neutralSummary: String
    let dominantFriction: String
    let decisionLean: DecisionLean
    let confidenceBand: ConfidenceBand
    let softNextStep: String

    let generatedAt: Date

    init(id: String = UUID().uuidString,
         sessionId: String,
         neutralSummary: String,
         dominantFriction: String,
         decisionLean: DecisionLean,
         confidenceBand: ConfidenceBand,
         softNextStep: String,
         generatedAt: Date = Date()) {
        self.id = id
        self.sessionId = sessionId
        self.neutralSummary = neutralSummary
        self.dominantFriction = dominantFriction
        self.decisionLean = decisionLean
        self.confidenceBand = confidenceBand
        self.softNextStep = softNextStep
        self.generatedAt = generatedAt
    }
}

struct DecisionLean: Codable {
    let direction: String
    let explanation: String

    init(direction: String, explanation: String) {
        self.direction = direction
        self.explanation = explanation
    }
}
