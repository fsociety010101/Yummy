//
//  YummyListView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyListView: View {
    var body: some View {
        NavigationView {
            List(MockData.meals) { meal in
                Text(meal.name)
            }
            .navigationTitle("🍔 Yummy")
        }
    }
}

#Preview {
    YummyListView()
}
