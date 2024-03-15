//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register() {
        guard validate() else {
            return
        }
            
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let user = User(id: id, email: email, name: name, createdAt: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email is not valid"
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 character length"
            return false
        }
            
        return true
    }
}
