//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 16/03/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
         isDone = state
    }
}
