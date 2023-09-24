//
//  DismissButton.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 24/09/2023.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.5)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
                .opacity(0.8)
        }
    }
}

#Preview {
    DismissButton()
}
