//
//  Meal.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import Foundation

struct Meal: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct MealResponse {
    let request: [Meal]
}

struct MockData {
    static let sampleMeal = Meal(id: 1,
                                      name: "Sample Meal",
                                      description: "Sample short desc",
                                      price: 199.99,
                                      imageURL: "",
                                      calories: 74,
                                      protein: 12,
                                      carbs: 9)
    
    static let meals = [sampleMeal, sampleMeal, sampleMeal, sampleMeal]
}
