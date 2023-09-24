//
//  YummyListView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyListView: View {
    
    @StateObject var viewModel = YummyListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedMeal: Meal?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.meals) { meal in
                    YummyMealCell(meal: meal)
                        .onTapGesture {
                            selectedMeal = meal
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍔 Yummy")
            }
            .onAppear{
                viewModel.getMeals()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            .disabled(isShowingDetail ? true : false)
            
            if isShowingDetail {
                YummyDetailView(meal: selectedMeal!,
                                isShowingDetail: $isShowingDetail)
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
