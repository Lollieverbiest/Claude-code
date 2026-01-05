//
//  ReflectionView.swift
//  DecisionReflection
//
//  Displays the personalized reflection after completing a decision flow.
//

import SwiftUI

struct ReflectionView: View {
    let reflection: ReflectionOutput
    @ObservedObject var viewModel: DecisionFlowViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reflection")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Here's what stood out from your answers")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 8)

                // Reflection sections
                VStack(spacing: 24) {
                    ReflectionSection(
                        title: "Summary",
                        content: reflection.neutralSummary
                    )

                    ReflectionSection(
                        title: "Trade-off",
                        content: reflection.tradeoffSpotlight
                    )

                    ReflectionSection(
                        title: "Looking Ahead",
                        content: reflection.futureReflection
                    )

                    if let pause = reflection.softPause {
                        ReflectionSection(
                            title: nil,
                            content: pause,
                            isHighlighted: true
                        )
                    }
                }

                // Action button
                Button(action: {
                    viewModel.reset()
                }) {
                    Text("Reflect on Another Decision")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color.primary)
                        .cornerRadius(12)
                }
                .padding(.top, 16)
            }
            .padding(24)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
    }
}

struct ReflectionSection: View {
    let title: String?
    let content: String
    var isHighlighted: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let title = title {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                    .fontWeight(.medium)
            }

            Text(content)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(isHighlighted ? Color.primary.opacity(0.05) : Color(.systemBackground))
        .cornerRadius(16)
        .overlay(
            isHighlighted ?
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary.opacity(0.2), lineWidth: 1)
            : nil
        )
    }
}

#Preview {
    let output = ReflectionOutput(
        sessionId: "preview",
        neutralSummary: "You're considering buying noise-canceling headphones, something that's been on your mind for some time.",
        tradeoffSpotlight: "Choosing this likely means setting aside the option to save this money for now.",
        futureReflection: "You anticipate positive feelings about this. Purchases that meet ongoing needs tend to maintain their value over time.",
        softPause: "You don't need to decide right now. Revisiting this later may give you a clearer signal."
    )

    return ReflectionView(reflection: output, viewModel: DecisionFlowViewModel())
}
