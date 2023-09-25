//
//  YummyOrderView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyOrderView: View {
    
    @State private var orderItems = MockData.sampleMeals
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List {
                        ForEach(MockData.sampleMeals) { meal in
                             YummyMealCell(meal: meal)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("🧾 Orders")
                    
                    Button {
                        print("tapped place order button")
                    } label: {
                        OrderButton(title: "Place order")
                    }
                    .padding(.bottom, 30)
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nAdd some meals first to place the order.")
                }
            }
            
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    YummyOrderView()
}
