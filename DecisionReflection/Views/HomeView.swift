//
//  HomeView.swift
//  DecisionReflection
//
//  The main entry point of the app.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = DecisionFlowViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.currentSession == nil {
                CategorySelectionView(viewModel: viewModel)
            } else if viewModel.isComplete, let reflection = viewModel.reflection {
                ReflectionView(reflection: reflection, viewModel: viewModel)
            } else {
                QuestionFlowView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    HomeView()
}
