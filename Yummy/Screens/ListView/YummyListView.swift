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
                    YummyMealCell(meal: meal)
                        .onTapGesture {
                            viewModel.selectedMeal = meal
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍔 Yummy")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear{
                viewModel.getMeals()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                YummyDetailView(meal: viewModel.selectedMeal!,
                                isShowingDetail: $viewModel.isShowingDetail)
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
