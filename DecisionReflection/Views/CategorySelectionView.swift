//
//  CategorySelectionView.swift
//  DecisionLean
//
//  View for selecting a decision category.
//

import SwiftUI

struct CategorySelectionView: View {
    @ObservedObject var viewModel: DecisionFlowViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    Text("Decision Lean")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Make fewer wrong decisions — without guilt or rules.")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)

                    Text("The goal isn't perfect rationality — just fewer wrong decisions.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .italic()
                        .padding(.top, 4)
                }
                .padding(.top, 8)

                // Global Disclaimer
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Image(systemName: "info.circle")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Important")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                            .fontWeight(.medium)
                    }

                    Text("This app does not provide financial, medical, legal, or safety advice. It supports personal reflection only. All decisions remain your own.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .background(Color(.systemGray6))
                .cornerRadius(12)

                // Categories
                VStack(alignment: .leading, spacing: 16) {
                    Text("What kind of decision are you considering?")
                        .font(.headline)

                    ForEach(availableCategories) { category in
                        CategoryCard(category: category) {
                            viewModel.startFlow(for: category)
                        }
                    }
                }
            }
            .padding(24)
        }
        .background(Color(.systemGroupedBackground))
    }

    private var availableCategories: [DecisionCategory] {
        // Only show categories with implemented flows
        DecisionCategory.allCases.filter { category in
            !FlowDefinitions.flows(for: category).isEmpty
        }
    }
}

#Preview {
    CategorySelectionView(viewModel: DecisionFlowViewModel())
}
