//
//  YummyApp.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

@main
struct YummyApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            YummyTabView().environmentObject(order)
        }
    }
}
