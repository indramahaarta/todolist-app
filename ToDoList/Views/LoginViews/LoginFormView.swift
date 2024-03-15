//
//  LoginFormView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct LoginFormView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        Form {
            if !loginViewModel.errorMessage.isEmpty {
                Text(loginViewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            TextField("Email Address", text:$loginViewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Log In", background: .blue) {
                loginViewModel.login()
            }
            .padding()
        }
    }
}

#Preview {
    LoginFormView()
}
