//
//  QuestionFlowView.swift
//  DecisionReflection
//
//  Main view for displaying and answering questions.
//

import SwiftUI

struct QuestionFlowView: View {
    @ObservedObject var viewModel: DecisionFlowViewModel
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            // Progress bar
            ProgressBar(progress: viewModel.progress)
                .padding(.horizontal, 24)
                .padding(.top, 16)

            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    if let question = viewModel.currentQuestion {
                        // Question text
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.currentSession?.flow.questions.count ?? 0)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)

                            Text(question.text)
                                .font(.title2)
                                .fontWeight(.medium)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.top, 32)

                        // Answer input
                        answerInput(for: question)
                            .padding(.top, 8)
                    }
                }
                .padding(24)
            }

            // Navigation buttons
            HStack(spacing: 16) {
                if viewModel.currentQuestionIndex > 0 {
                    Button(action: {
                        viewModel.previousQuestion()
                    }) {
                        Text("Back")
                            .font(.body)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                }

                Button(action: {
                    viewModel.nextQuestion()
                }) {
                    Text(viewModel.isLastQuestion ? "Finish" : "Continue")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(viewModel.canContinue ? Color.primary : Color(.systemGray4))
                        .cornerRadius(12)
                }
                .disabled(!viewModel.canContinue)
            }
            .padding(24)
            .background(Color(.systemBackground))
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    viewModel.reset()
                }
                .foregroundColor(.secondary)
            }
        }
    }

    @ViewBuilder
    private func answerInput(for question: Question) -> some View {
        switch question.type {
        case .freeText:
            TextField(question.placeholder ?? "Type your answer...", text: Binding(
                get: { viewModel.currentAnswers[question.id] ?? "" },
                set: { viewModel.saveAnswer($0, for: question.id) }
            ))
            .textFieldStyle(.plain)
            .font(.body)
            .padding(16)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .focused($isTextFieldFocused)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    isTextFieldFocused = true
                }
            }

        case .singleChoice, .multipleChoice:
            VStack(spacing: 12) {
                if let options = question.options {
                    ForEach(options, id: \.self) { option in
                        AnswerButton(
                            text: option,
                            isSelected: viewModel.currentAnswers[question.id] == option,
                            action: {
                                viewModel.saveAnswer(option, for: question.id)
                            }
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    let viewModel = DecisionFlowViewModel()
    viewModel.startFlow(for: .purchases)
    return QuestionFlowView(viewModel: viewModel)
}
