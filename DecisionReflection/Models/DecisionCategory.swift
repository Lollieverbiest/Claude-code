//
//  DecisionCategory.swift
//  DecisionReflection
//
//  A model representing different types of decisions users can reflect on.
//

import Foundation

enum DecisionCategory: String, Codable, CaseIterable, Identifiable {
    case purchases = "Purchases"
    case investments = "Investments"
    case timeAndEnergy = "Time & Energy"
    case experiences = "Experiences"

    var id: String { rawValue }

    var description: String {
        switch self {
        case .purchases:
            return "Consumer goods, subscriptions, gadgets"
        case .investments:
            return "Financial decisions"
        case .timeAndEnergy:
            return "Commitments and obligations"
        case .experiences:
            return "Travel, events, memories"
        }
    }

    var icon: String {
        switch self {
        case .purchases:
            return "cart"
        case .investments:
            return "chart.line.uptrend.xyaxis"
        case .timeAndEnergy:
            return "clock"
        case .experiences:
            return "sparkles"
        }
    }
}
