//
//  CocktailListViewModel.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation
import CocktailKit

@MainActor
final class CocktailListViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: CocktailFetchable
    
    init(service: CocktailFetchable) {
        self.service = service
        
        Task {
            await load()
        }
    }
    
    func load() async {
        isLoading = true
        errorMessage = nil
        
        do {
            cocktails = try await service.fetchCocktails()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
