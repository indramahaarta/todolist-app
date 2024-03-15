//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil

    init() {
        fetchUser()
    }

    func fetchUser() {
        print("Trying to fetch user")
        guard let uid = Auth.auth().currentUser?.uid else {
            print("No authenticated user found")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { [weak self] (document: DocumentSnapshot?, error: Error?) in
            guard let document = document, document.exists, error == nil else {
                print("Error fetching document: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let data = document.data() else {
                print("Document data is not found")
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? uid, 
                    email: data["email"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    createdAt: data["createdAt"] as? TimeInterval ?? 0
                )
            }

        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            user = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
