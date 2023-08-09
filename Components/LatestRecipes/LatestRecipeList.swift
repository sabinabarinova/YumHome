//
//  LatestRecipeList.swift
//  Rec
//
//  Created by Adil Meirambek on 14.05.2023.
//

import SwiftUI

struct LatestRecipeList: View {
    var recipes: [Recipe]
    @State private var isShowing = false
    @State var searchQuery = ""

    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        
        VStack {
            SearchBarView(searchQuery: $searchQuery)
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(recipes
                    .filter({"\($0.name.lowercased())".contains(searchQuery.lowercased()) || searchQuery.isEmpty})
                    .sorted(by: {$0.datePosted.compare($1.datePosted) == .orderedDescending})) { recipe in
                    
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)

                    }
  
                }
                
            }
        }
        .frame(width: 360)
        .padding(.top)
        
    }
}

struct LatestRecipeList_Previews: PreviewProvider {
    
    static var previews: some View {
        let keyDate = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)

        ScrollView(.vertical) {
            LatestRecipeList(recipes: Recipe.all.filter{$0.datePosted > keyDate})
        }
        
        
    }
}
