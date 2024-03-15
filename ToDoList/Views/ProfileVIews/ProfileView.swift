//
//  ProfileView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 14/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name")
                            Text(user.name)
                        }
                        .padding()
                        
                        HStack {
                            Text("Email")
                            Text(user.email)
                        }
                        .padding()
                        
                        HStack {
                            Text("Member Since")
                            Text("\(Date(timeIntervalSince1970: user.createdAt).formatted(date: .complete, time: .omitted))")
                        }
                        .padding()
                    }
                    
                    Button("Log out") {
                        viewModel.logout()
                    }
                    .foregroundColor(.red)
                    .padding()
                } else {
                    Text("Loading...")
                }
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
