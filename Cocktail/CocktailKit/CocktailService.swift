//
//  CocktailService.swift
//  CocktailKit
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation

public final class CocktailService: CocktailFetchable {
    private let session: URLSession
    private let url = URL(string: "http://schibsted:mojito@schibsted-nde-apps-recruitment-task.eu-central-1.elasticbeanstalk.com/cocktails")!
    
    private let username: String
    private let password: String
    
    public init(session: URLSession = .shared, username: String, password: String) {
        self.session = session
        self.username = username
        self.password = password
    }
    
    public func fetchCocktails() async throws -> [Cocktail] {
        var request = URLRequest(url: url)
        let credentials = "\(username):\(password)"
        let base64 = Data(credentials.utf8).base64EncodedString()
        
        request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode([Cocktail].self, from: data)
    }
}

public final class CocktailServiceMock: CocktailFetchable {
    
    public init() {}
    
    public func fetchCocktails() async throws -> [Cocktail] {
        return mockCocktails()
    }
    
    private func mockCocktails() -> [Cocktail] {
        return [
            Cocktail(id: "1", name: "Mojito", image: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg"),
            Cocktail(id: "2", name: "Martini", image: "https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg"),
            Cocktail(id: "3", name: "Margarita", image: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")
        ]
    }
}
