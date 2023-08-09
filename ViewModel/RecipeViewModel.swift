//
//  RecipeViewModel.swift
//  Rec
//
//  Created by Adil Meirambek on 29.01.2023.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published var searchQuery = ""
    @Published private(set) var cooks: [FamousCook] = []
    @Published private(set) var users: [User] = []

    init() {
        recipes = Recipe.all
        cooks = FamousCook.allCooks
        users = User.users
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func addUser(user: User) {
        users.append(user)
    }

    func deleteRecipe(index: Int) {
        recipes.remove(at: index)
    }
    
    
}
