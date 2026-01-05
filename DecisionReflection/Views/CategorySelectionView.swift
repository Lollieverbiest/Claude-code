//
//  CategorySelectionView.swift
//  DecisionReflection
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
                VStack(alignment: .leading, spacing: 8) {
                    Text("Decision Reflection")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("The goal isn't perfect rationality — just fewer wrong decisions.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding(.top, 8)

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
