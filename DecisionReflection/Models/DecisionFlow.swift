//
//  DecisionFlow.swift
//  DecisionReflection
//
//  Represents a complete decision flow with questions and metadata.
//

import Foundation

enum FlowType: String, Codable {
    case reflectionFirst = "reflection_first"
    case tradeoffFirst = "tradeoff_first"
}

struct DecisionFlow: Codable, Identifiable {
    let id: String
    let category: DecisionCategory
    let flowType: FlowType
    let name: String
    let description: String
    let questions: [Question]

    init(id: String = UUID().uuidString,
         category: DecisionCategory,
         flowType: FlowType,
         name: String,
         description: String,
         questions: [Question]) {
        self.id = id
        self.category = category
        self.flowType = flowType
        self.name = name
        self.description = description
        self.questions = questions
    }
}

struct DecisionSession: Codable, Identifiable {
    let id: String
    let flow: DecisionFlow
    let answers: [Answer]
    let startedAt: Date
    let completedAt: Date?

    init(id: String = UUID().uuidString,
         flow: DecisionFlow,
         answers: [Answer] = [],
         startedAt: Date = Date(),
         completedAt: Date? = nil) {
        self.id = id
        self.flow = flow
        self.answers = answers
        self.startedAt = startedAt
        self.completedAt = completedAt
    }

    var isComplete: Bool {
        completedAt != nil
    }

    func answer(for questionId: String) -> Answer? {
        answers.first { $0.questionId == questionId }
    }
}
