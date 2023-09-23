//
//  MealListCell.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct MealListCell: View {
    
    let meal: Meal
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
                .cornerRadius(8)
                
            VStack (alignment: .leading, spacing: 5) {
                Text(meal.name)
                    .font(.title3 )
                    .fontWeight(.medium)
                
                Text("$\(meal.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    MealListCell(meal: MockData.sampleMeal)
}
