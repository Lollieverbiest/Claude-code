//
//  ReflectionView.swift
//  DecisionLean
//
//  Displays the 5-block Decision Lean output after completing a decision flow.
//

import SwiftUI

struct ReflectionView: View {
    let reflection: ReflectionOutput
    @ObservedObject var viewModel: DecisionFlowViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Decision Lean")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Here's what stood out from your answers")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 8)

                //MARK: - 5-Block Output Structure

                // Block 1: Neutral Summary
                ReflectionSection(
                    title: "Summary",
                    content: reflection.neutralSummary
                )

                // Block 2: Dominant Friction
                ReflectionSection(
                    title: "Dominant Friction",
                    content: reflection.dominantFriction,
                    icon: "exclamationmark.triangle"
                )

                // Block 3: Decision Lean (KEY USP)
                DecisionLeanSection(lean: reflection.decisionLean)

                // Block 4: Confidence Band
                ConfidenceBandSection(band: reflection.confidenceBand)

                // Block 5: Soft Next Step
                ReflectionSection(
                    title: "Next Step",
                    content: reflection.softNextStep,
                    isHighlighted: true
                )

                // Disclaimer
                DisclaimerSection(category: viewModel.selectedCategory)

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
                .padding(.top, 8)
            }
            .padding(24)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Components

struct ReflectionSection: View {
    let title: String
    let content: String
    var icon: String? = nil
    var isHighlighted: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
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

struct DecisionLeanSection: View {
    let lean: DecisionLean

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Decision Lean")
                .font(.caption)
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .fontWeight(.medium)

            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .foregroundColor(.primary)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("This decision currently leans toward:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(lean.direction)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                }

                Text(lean.explanation)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.primary.opacity(0.08))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary.opacity(0.3), lineWidth: 2)
        )
    }
}

struct ConfidenceBandSection: View {
    let band: ConfidenceBand

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Confidence")
                .font(.caption)
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .fontWeight(.medium)

            HStack(spacing: 12) {
                confidenceIcon
                    .font(.title3)

                Text(band.rawValue)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    @ViewBuilder
    private var confidenceIcon: some View {
        switch band {
        case .low:
            Image(systemName: "gauge.low")
                .foregroundColor(.orange)
        case .medium:
            Image(systemName: "gauge.medium")
                .foregroundColor(.yellow)
        case .high:
            Image(systemName: "gauge.high")
                .foregroundColor(.green)
        }
    }
}

struct DisclaimerSection: View {
    let category: DecisionCategory?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Disclaimer")
                .font(.caption2)
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .fontWeight(.medium)

            Text(disclaimerText)
                .font(.caption)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private var disclaimerText: String {
        let categoryDisclaimer: String
        switch category {
        case .purchases, .investments:
            categoryDisclaimer = "This reflection is not financial advice. "
        case .timeAndEnergy:
            categoryDisclaimer = "This reflection does not account for external obligations. "
        case .experiences:
            categoryDisclaimer = "This reflection does not assess physical safety or risk. "
        case .none:
            categoryDisclaimer = ""
        }

        return categoryDisclaimer + "This app supports personal reflection only. All decisions remain your own."
    }
}

// MARK: - Preview

#Preview {
    let output = ReflectionOutput(
        sessionId: "preview",
        neutralSummary: "You're considering noise-canceling headphones, mainly driven by timing and current availability.",
        dominantFriction: "Short-term urgency appears stronger than long-term value.",
        decisionLean: DecisionLean(
            direction: "Lean toward waiting",
            explanation: "The timing feels urgent but your projection of future use is uncertain."
        ),
        confidenceBand: .medium,
        softNextStep: "The option is still there. Seeing how you feel about it tomorrow can be clarifying."
    )

    let vm = DecisionFlowViewModel()
    vm.selectedCategory = .purchases
    return ReflectionView(reflection: output, viewModel: vm)
}
