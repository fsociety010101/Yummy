//
//  YummyListViewModel.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

final class YummyListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    func getMeals() {
        NetworkManager.shared.getMeals { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let meals):
                    self.meals = meals
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
