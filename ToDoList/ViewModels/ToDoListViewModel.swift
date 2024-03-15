//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    @Published var showingCreateNewItem: Bool = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Function to delete To Do List based on id
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
    
    func togleIsDone(todo: ToDoListItem) {
        var newTodo = todo
        newTodo.setDone(!todo.isDone)
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(newTodo.id).setData(newTodo.asDictionary())
    }
}
