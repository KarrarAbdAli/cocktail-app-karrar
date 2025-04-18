//
//  CocktailFetachable.swift
//  CocktailKit
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation

public protocol CocktailFetchable {
    func fetchCocktails() async throws -> [Cocktail]
}
