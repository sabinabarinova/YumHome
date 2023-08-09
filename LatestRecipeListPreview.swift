//
//  LatestRecipeListPreview.swift
//  Rec
//
//  Created by Adil Meirambek on 27.05.2023.
//

import SwiftUI

struct LatestRecipeListPreview: View {
    var recipes: [Recipe]

    var body: some View {
        VStack {

            LazyHStack {
                ForEach(recipes.sorted(by: {$0.datePosted.compare($1.datePosted) == .orderedDescending})) { recipe in
                    
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)

                    }
//                    .sheet(isPresented: $isShowing) {
//                        RecipeView(recipe: recipe)
//                    }
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
        
    }
}

struct LatestRecipeListPreview_Previews: PreviewProvider {
    static var previews: some View {
        let keyDate = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)

        ScrollView(.horizontal) {
            LatestRecipeListPreview(recipes: Recipe.all.filter{$0.datePosted > keyDate})
        }
        
    }
}
