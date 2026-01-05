//
//  ReflectionOutput.swift
//  DecisionReflection
//
//  Model for the reflection output shown after completing a decision flow.
//

import Foundation

struct ReflectionOutput: Codable, Identifiable {
    let id: String
    let sessionId: String
    let neutralSummary: String
    let tradeoffSpotlight: String
    let futureReflection: String
    let softPause: String?
    let generatedAt: Date

    init(id: String = UUID().uuidString,
         sessionId: String,
         neutralSummary: String,
         tradeoffSpotlight: String,
         futureReflection: String,
         softPause: String? = nil,
         generatedAt: Date = Date()) {
        self.id = id
        self.sessionId = sessionId
        self.neutralSummary = neutralSummary
        self.tradeoffSpotlight = tradeoffSpotlight
        self.futureReflection = futureReflection
        self.softPause = softPause
        self.generatedAt = generatedAt
    }
}
