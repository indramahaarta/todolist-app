//
//  LoginView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                LoginFormView()
                CreateAccountView()
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
