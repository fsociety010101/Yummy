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
        ZStack {
            NavigationView {
                List(viewModel.meals) { meal in
                    MealListCell(meal: meal)
                }
                .navigationTitle("🍔 Yummy")
            }
            .onAppear{
                viewModel.getMeals()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    YummyListView()
}
