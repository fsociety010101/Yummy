//
//  YummyAccountViewModel.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 24/09/2023.
//

import SwiftUI

final class YummyAccountViewModel: ObservableObject {
    
    /* Using AppStorage instead of this */
    /*
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefils = false
     */
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidUsername
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    
}
