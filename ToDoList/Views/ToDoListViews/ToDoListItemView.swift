//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 16/03/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListViewModel
    var todo: ToDoListItem
    
    init(todo: ToDoListItem, viewModel: ToDoListViewModel) {
        self.todo = todo
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(todo.title)
                    .font(.body )
                    .bold()
                Text("\(Date(timeIntervalSince1970: todo.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.togleIsDone(todo: todo)
            } label : {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    ToDoListItemView(todo: .init(id: "123", title: "Pacaran with Deyuna", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: false), viewModel: ToDoListViewModel(userId: ""))
}
