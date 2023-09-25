//
//  YummyAccountView.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import SwiftUI

struct YummyAccountView: View {
    
    @StateObject var viewModel = YummyAccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email Address", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Date of Birth",
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                        hideKeyboard()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Order Confirmation Call", isOn: $viewModel.user.confirmationCall)
                    Toggle("Frequent Refils", isOn: $viewModel.user.frequentRefils)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
                
            }
            .navigationTitle("👽 Account")
            .scrollDismissesKeyboard(.interactively)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
            
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    YummyAccountView()
}
