//
//  ContentView.swift
//  ToDoList
//
//  Created by I Made Indra Mahaarta on 13/03/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignIn(), !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house")
                    }
                )
            }
            ProfileView()
                .tabItem {
                    Label(
                        title: { Text("Profile") },
                        icon: { Image(systemName: "person.circle") }
                    )
                }
        }
    }
}

#Preview {
    MainView()
}
