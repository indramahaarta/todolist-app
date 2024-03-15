//
//  CreateNewToDoListItemViewModel.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateNewToDoListItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save() -> Void {
        guard canSave() else {
            return
        }
        
        // Get Uid
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newItemUid = UUID().uuidString
        let newItem = ToDoListItem(id: newItemUid, title: title, dueDate: dueDate.timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: false)
        
        // Save Model to database
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("todos").document(newItemUid).setData(newItem.asDictionary())
        
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .newlines).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
