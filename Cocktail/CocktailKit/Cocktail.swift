//
//  Cocktail.swift
//  CocktailKit
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation

public struct Cocktail: Identifiable, Codable {
    public let id: String
    public let name: String
    public let image: String

    public init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
