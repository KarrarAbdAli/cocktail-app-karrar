//
//  LoginView.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Authentication")) {
                    TextField("Username", text: $appState.username)
                        .textContentType(.username)
                    SecureField("Password", text: $appState.password)
                        .textContentType(.password)
                }

                Section {
                    Toggle("Use Mock API", isOn: $appState.useMockAPI)
                }

                Section {
                    Button("Login") {
                        appState.isLoggedIn = true
                    }
                    .disabled(appState.username.isEmpty || appState.password.isEmpty)
                }
            }
            .navigationTitle("Login")
        }
    }
}
