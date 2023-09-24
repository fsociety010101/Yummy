//
//  YummyListViewModel.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

final class YummyListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedMeal: Meal?
    
    func getMeals() {
        isLoading = true
        
        // new in swift 5.3, capture [swift] on top and not use it everywhere around func
        NetworkManager.shared.getMeals { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let meals):
                    self.meals = meals
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToCopmlete
                    }
                }
            }
        }
    }
}
