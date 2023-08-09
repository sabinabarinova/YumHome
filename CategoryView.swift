//
//  CategoryView.swift
//  Rec
//
//  Created by Adil Meirambek on 29.01.2023.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel

    var category: Category

    var recipes: [Recipe] {
        return recipeVM.recipes.filter {$0.category == category.rawValue}
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
        ScrollView {
            AllRecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)

        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.breakfast)
            .environmentObject(RecipeViewModel())
    }
}
