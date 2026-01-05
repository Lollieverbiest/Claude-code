//
//  Question.swift
//  DecisionReflection
//
//  Models for questions and answer options.
//

import Foundation

enum QuestionType: String, Codable {
    case freeText
    case singleChoice
    case multipleChoice
}

struct Question: Codable, Identifiable {
    let id: String
    let text: String
    let type: QuestionType
    let options: [String]?
    let placeholder: String?

    init(id: String, text: String, type: QuestionType, options: [String]? = nil, placeholder: String? = nil) {
        self.id = id
        self.text = text
        self.type = type
        self.options = options
        self.placeholder = placeholder
    }
}

struct Answer: Codable, Identifiable {
    let id: String
    let questionId: String
    let value: String
    let timestamp: Date

    init(id: String = UUID().uuidString, questionId: String, value: String, timestamp: Date = Date()) {
        self.id = id
        self.questionId = questionId
        self.value = value
        self.timestamp = timestamp
    }
}
