//
//  ToDoListView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue:ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(todo: item, viewModel: viewModel)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingCreateNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingCreateNewItem, content: {
                CreateNewToDoItemView(createNewItemPresented: $viewModel.showingCreateNewItem)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "1Wx70ajmQLcDYZ7U8A2wMr5dunI2")
}
