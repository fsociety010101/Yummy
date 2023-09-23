//
//  YummyError.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import Foundation

enum YummyError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
