//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//
import FirebaseAuth
import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
            
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, 
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email is not valid"
            return false
        }
            
        return true
    }
}
