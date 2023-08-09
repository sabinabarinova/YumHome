//
//  RecipeList.swift
//  Rec
//
//

import SwiftUI

struct AllRecipeList: View {
    var recipes: [Recipe]
    @State private var isShowing = false
    @State var searchQuery = ""
    
  
    
    @State private var sorting = 0


    var columns = Array(repeating: GridItem(.flexible()), count: 2)


 
    var body: some View {
        VStack {
           

            Spacer()

            SearchBarView(searchQuery: $searchQuery)
            
            Divider().padding(8)
            
            HStack {
                Text("Sort by:")
                    .font(.custom("Poppins-SemiBold", size: 16))

                Picker("", selection: $sorting) {
                    
                    
                    Text("Name")
                        .font(.custom("Poppins-SemiBold", size: 12))
                        .tag(0)
                        

                    Text("Date")
                        .tag(1)
                        .font(.custom("Poppins-SemiBold", size: 12))
                    
                    Text("Rating")
                        .tag(2)
                        .font(.custom("Poppins-SemiBold", size: 12))



                }
                .pickerStyle(.segmented)
                .font(.custom("Poppins-SemiBold", size: 12))
            }
            .frame(width: 348)
            
            switch sorting {
            case 0 :
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(recipes
                        .filter({"\($0.name.lowercased())".contains(searchQuery.lowercased()) || searchQuery.isEmpty})
                        .sorted(by: {$0.name.compare($1.name)  == .orderedAscending})) { recipe in
                       
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)

                        }
                        
                    }
                }
                
            case 1:
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(recipes
                        .filter({"\($0.name.lowercased())".contains(searchQuery.lowercased()) || searchQuery.isEmpty})
                        .sorted(by: {$0.datePosted.compare($1.datePosted)  == .orderedDescending})) { recipe in
                       
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)

                        }
                        
                    }
                }
                
            case 2:
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(recipes
                        .filter({"\($0.name.lowercased())".contains(searchQuery.lowercased()) || searchQuery.isEmpty})
                        .sorted(by: {$0.rating > $1.rating})) { recipe in
                       
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)

                        }
                        
                    }
                }


            default:
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(recipes
                        .filter({"\($0.name.lowercased())".contains(searchQuery.lowercased()) || searchQuery.isEmpty})
                        .sorted(by: {$0.name.compare($1.name)  == .orderedAscending})) { recipe in
                       
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)

                        }
                        
                    }
                }
            }

            
//            LazyHStack {
//                ForEach(recipes) { recipe in
//                    NavigationLink(destination: RecipeView(recipe: recipe)) {
//                        RecipeCard(recipe: recipe)
//                    }
//                }
//            }
//            .padding(.vertical)
        }
        .frame(width: 360)

        .padding(.horizontal)
    }
}

struct AllRecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical){
            AllRecipeList(recipes: Recipe.all)
        }
    }
}
