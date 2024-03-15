//
//  RegisterFormView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct RegisterFormView: View {
   @StateObject var registerModel = RegisterViewModel()
    
    var body: some View {
        Form {
            if !registerModel.errorMessage.isEmpty {
                Text(registerModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            TextField("Fullname", text: $registerModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Email Address", text: $registerModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $registerModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Sign Up", background: .green) {
                registerModel.register()
            }
            .padding()
        }
    }
}

#Preview {
    RegisterFormView()
}
