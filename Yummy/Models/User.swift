//
//  User.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 24/09/2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefils = false
}
