//
//  OrderButton.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 24/09/2023.
//

import SwiftUI

struct OrderButton: View {
    
    // not ordinary String, to have specifiers like "%.2f" etc.
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color("brandPrimary"))
            .cornerRadius(10)
    }
}

#Preview {
    OrderButton(title: "Test Button")
}
