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
            VStack{
                List {
                    ForEach(MockData.sampleMeals) { meal in
                         YummyMealCell(meal: meal)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                
                Button {
                    print("tapped place order button")
                } label: {
                    OrderButton(title: "Place order")
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    YummyOrderView()
}
