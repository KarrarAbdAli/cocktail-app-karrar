//
//  AppState.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation

final class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var useMockAPI = true
    @Published var username = ""
    @Published var password = ""
}
