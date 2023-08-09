//
//  LatestRecipeListView.swift
//  Rec
//
//  Created by Adil Meirambek on 14.05.2023.
//

import SwiftUI

struct LatestRecipeListView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    

 
    
    var recipes: [Recipe] {
        let keyDate = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)


        return recipeVM.recipes
            .filter{$0.datePosted > keyDate}
            .sorted(by: {$0.datePosted.compare($1.datePosted) == .orderedDescending})
    }
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .font(.custom("Poppins-SemiBold", size: 20))
               
            }
        }
    }
    
    var body: some View {
        ScrollView (.vertical) {
            LatestRecipeList(recipes: recipes)
            
        }
        
        .navigationTitle("Our Latest Recipes")
        .navigationViewStyle(.stack)
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
    }
    
}

struct LatestRecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        LatestRecipeListView()
            .environmentObject(RecipeViewModel())
    }
}
