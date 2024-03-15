//
//  CreateAccountView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct CreateAccountView: View {
    var body: some View {
        VStack {
            Text("New around here?")
            NavigationLink("Create an account") {
                RegisterView()
            }
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    CreateAccountView()
}
