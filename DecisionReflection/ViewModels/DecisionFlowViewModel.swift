//
//  DecisionFlowViewModel.swift
//  DecisionReflection
//
//  Main view model for managing decision flow state and progression.
//

import Foundation
import Combine

@MainActor
class DecisionFlowViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var selectedCategory: DecisionCategory?
    @Published var currentSession: DecisionSession?
    @Published var currentQuestionIndex: Int = 0
    @Published var currentAnswers: [String: String] = [:]
    @Published var reflection: ReflectionOutput?
    @Published var isComplete: Bool = false

    // MARK: - Private Properties

    private let persistenceService: PersistenceService
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Computed Properties

    var currentQuestion: Question? {
        guard let session = currentSession else { return nil }
        guard currentQuestionIndex < session.flow.questions.count else { return nil }
        return session.flow.questions[currentQuestionIndex]
    }

    var progress: Double {
        guard let session = currentSession else { return 0 }
        let total = Double(session.flow.questions.count)
        return total > 0 ? Double(currentQuestionIndex) / total : 0
    }

    var canContinue: Bool {
        guard let question = currentQuestion else { return false }
        return currentAnswers[question.id] != nil
    }

    var isLastQuestion: Bool {
        guard let session = currentSession else { return false }
        return currentQuestionIndex == session.flow.questions.count - 1
    }

    // MARK: - Initialization

    init(persistenceService: PersistenceService = PersistenceService.shared) {
        self.persistenceService = persistenceService
    }

    // MARK: - Public Methods

    func startFlow(for category: DecisionCategory) {
        guard let flow = FlowDefinitions.randomFlow(for: category) else {
            return
        }

        selectedCategory = category
        currentSession = DecisionSession(flow: flow)
        currentQuestionIndex = 0
        currentAnswers = [:]
        isComplete = false
        reflection = nil
    }

    func saveAnswer(_ value: String, for questionId: String) {
        currentAnswers[questionId] = value
    }

    func nextQuestion() {
        guard let session = currentSession,
              let question = currentQuestion,
              let answerValue = currentAnswers[question.id] else {
            return
        }

        // Save answer to session
        let answer = Answer(questionId: question.id, value: answerValue)
        var updatedAnswers = session.answers
        updatedAnswers.append(answer)

        currentSession = DecisionSession(
            id: session.id,
            flow: session.flow,
            answers: updatedAnswers,
            startedAt: session.startedAt,
            completedAt: session.completedAt
        )

        // Move to next question or complete
        if isLastQuestion {
            completeFlow()
        } else {
            currentQuestionIndex += 1
        }
    }

    func previousQuestion() {
        guard currentQuestionIndex > 0 else { return }
        currentQuestionIndex -= 1
    }

    func completeFlow() {
        guard var session = currentSession else { return }

        session = DecisionSession(
            id: session.id,
            flow: session.flow,
            answers: session.answers,
            startedAt: session.startedAt,
            completedAt: Date()
        )

        currentSession = session
        reflection = ReflectionGenerator.generate(from: session)
        isComplete = true

        // Persist session
        persistenceService.saveSession(session)
    }

    func reset() {
        selectedCategory = nil
        currentSession = nil
        currentQuestionIndex = 0
        currentAnswers = [:]
        reflection = nil
        isComplete = false
    }
}
