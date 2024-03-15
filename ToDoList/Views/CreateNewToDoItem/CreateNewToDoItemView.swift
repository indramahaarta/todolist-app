//
//  CreateNewToDoItemView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import SwiftUI

struct CreateNewToDoItemView: View {
    @StateObject var viewModel = CreateNewToDoListItemViewModel()
    @Binding var createNewItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form  {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    if !viewModel.canSave() {
                        viewModel.showAlert = true
                        
                    } else {
                        viewModel.save()
                        createNewItemPresented = false
                    }
                }
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            })
        }
        .padding()
    }
}

#Preview {
    CreateNewToDoItemView(createNewItemPresented: Binding(get: {
        return true
    }, set: { _, _ in
        
    }))
}
