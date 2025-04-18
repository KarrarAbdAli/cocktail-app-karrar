//
//  CocktailApp.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import SwiftUI

@main
struct CocktailApp: App {
    @StateObject private var appState = AppState()

       var body: some Scene {
           WindowGroup {
               if appState.isLoggedIn {
                   Text("TODO CocktailListView")
               } else {
                   LoginView()
                       .environmentObject(appState)
               }
           }
       }
}
