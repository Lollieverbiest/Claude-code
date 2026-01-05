//
//  ProgressBar.swift
//  DecisionReflection
//
//  A simple progress indicator for the question flow.
//

import SwiftUI

struct ProgressBar: View {
    let progress: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 4)

                Rectangle()
                    .fill(Color.primary)
                    .frame(width: geometry.size.width * progress, height: 4)
            }
        }
        .frame(height: 4)
        .cornerRadius(2)
    }
}
