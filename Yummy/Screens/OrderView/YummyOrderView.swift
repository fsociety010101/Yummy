//
//  YummyOrderView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyOrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) { meal in
                             YummyMealCell(meal: meal)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("tapped place order button")
                    } label: {
                        OrderButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nAdd some meals.")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    YummyOrderView()
}
