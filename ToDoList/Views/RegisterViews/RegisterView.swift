//
//  RegisterView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
        RegisterFormView()
        Spacer()
    }
}

#Preview {
    RegisterView()
}
