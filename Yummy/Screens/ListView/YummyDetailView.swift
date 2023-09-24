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
                    VStack {
                        Text("Calories")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(meal.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack {
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(meal.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack {
                        Text("Protein")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(meal.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                Text("$\(meal.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color("brandPrimary"))
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.5)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
                    .opacity(0.8)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    YummyDetailView(meal: MockData.sampleMeal, isShowingDetail: .constant(true))
}
