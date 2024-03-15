//
//  User.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import Foundation

struct User: Codable {
    var id: String;
    var email: String;
    var name: String;
    var createdAt: TimeInterval;
}
