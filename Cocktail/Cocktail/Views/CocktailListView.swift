//
//  CocktailListView.swift
//  Cocktail
//
//  Created by Karrar Abd Ali on 18/04/2025.
//

import Foundation
import SwiftUI

struct CocktailListView: View {
    @ObservedObject var viewModel: CocktailListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Cocktails...")
                } else if let error = viewModel.errorMessage {
                    errorView(for: error)
                } else {
                    cocktailList
                }
            }
            .navigationTitle("Cocktails")
        }
        .task {
            await viewModel.load()
        }
    }
    
    private var cocktailList: some View {
        List(viewModel.cocktails) { cocktail in
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: cocktail.image)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Color.red
                    default:
                        ProgressView()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(cocktail.name)
                    .font(.headline)
            }
            .padding(.vertical, 4)
        }
    }
    
    private func errorView(for error: String) -> some View {
        VStack {
            Text("Error:")
            Text(error).foregroundColor(.red)
            
            Button("Retry") {
                Task {
                    await viewModel.load()
                }
            }
        }.padding()
    }
    
}
