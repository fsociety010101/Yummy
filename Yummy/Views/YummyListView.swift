//
//  YummyListView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyListView: View {
    
    @StateObject var viewModel = YummyListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                MealListCell(meal: meal)
            }
            .navigationTitle("🍔 Yummy")
        }
        .onAppear{
            viewModel.getMeals()
        }
    }
}

#Preview {
    YummyListView()
}
