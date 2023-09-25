//
//  YummyTabView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            YummyListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            YummyAccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            YummyOrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}

#Preview {
    YummyTabView()
}
