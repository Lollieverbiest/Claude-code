//
//  CategoryCard.swift
//  DecisionReflection
//
//  A minimalist card component for decision categories.
//

import SwiftUI

struct CategoryCard: View {
    let category: DecisionCategory
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: category.icon)
                        .font(.title2)
                        .foregroundColor(.primary)
                    Spacer()
                }

                Text(category.rawValue)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)

                Text(category.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
