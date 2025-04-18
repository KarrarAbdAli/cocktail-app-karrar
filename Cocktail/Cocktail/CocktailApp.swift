//
//  CocktailApp.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import SwiftUI
import CocktailKit


@main
struct CocktailApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                let service: CocktailFetchable = appState.useMockAPI
                ? CocktailServiceMock()
                : CocktailService(username: appState.username, password: appState.password)
                
                let viewModel = CocktailListViewModel(service: service)
                
                CocktailListView(viewModel: viewModel)
                    .environmentObject(appState)
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}
