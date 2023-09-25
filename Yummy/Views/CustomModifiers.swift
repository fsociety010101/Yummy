//
//  CustomModifiers.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 25/09/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
            .fontWeight(.semibold)
    }
}

extension View {
    func yummyButton() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
