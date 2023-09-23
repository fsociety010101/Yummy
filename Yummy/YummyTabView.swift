//
//  YummyTabView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyTabView: View {
    var body: some View {
        TabView {
            YummyListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            YummyAccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            YummyOrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    YummyTabView()
}
