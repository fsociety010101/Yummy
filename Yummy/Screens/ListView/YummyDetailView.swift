//
//  YummyDetailView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyDetailView: View {
    
    let meal: Meal
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            YummyRemoteImage(urlString: meal.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(meal.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(meal.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: meal.calories)
                    NutritionInfo(title: "Carbs", value: meal.carbs)
                    NutritionInfo(title: "Protein", value: meal.protein)
                }
            }
            
            Spacer()
            
            Button {
                print("tapped order button")
            } label: {
                OrderButton(title: "$\(meal.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            print("tapped dismiss button")
            isShowingDetail = false
        } label: {
            DismissButton()
        }, alignment: .topTrailing)
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    YummyDetailView(meal: MockData.sampleMeal1, isShowingDetail: .constant(true))
}
