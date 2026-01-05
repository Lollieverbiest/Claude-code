//
//  AnswerButton.swift
//  DecisionReflection
//
//  A button component for answer options.
//

import SwiftUI

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)
                    .foregroundColor(isSelected ? .white : .primary)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.primary : Color(.systemGray6))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
