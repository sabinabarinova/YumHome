//
//  RecipeCardSmall.swift
//  Rec
//
//  Created by Adil Meirambek on 01.06.2023.
//

import SwiftUI

struct RecipeCardSmall: View {
    @EnvironmentObject var recipeVM: RecipeViewModel

    var recipe: Recipe
    var recipes: [Recipe]
    var body: some View {
        VStack {
            
            if !recipe.imageLink.isEmpty {
                AsyncImage(url: URL(string: recipe.imageLink)){image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .overlay(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.4), .clear, .black]), startPoint: .top, endPoint: .bottom)
                                ).opacity(0.8)
                        }
                        .overlay(alignment: .bottom) {
                            
                            HStack {
                                Text(recipe.name)
                                    .multilineTextAlignment(.leading)
                                
                                    .font(.custom("Poppins-SemiBold", size: 10))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                                    .truncationMode(.tail)
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 40, height: 12)
                                    .foregroundColor(.white)
                                    .overlay (alignment: .center) {
                                        HStack (alignment: .center, spacing: 4) {
                                            Image(systemName: "heart")
                                                .foregroundColor(.black)
                                                .font(.system(size: 8))
                                            Text(String(recipe.likes))
                                                .font(.custom("Poppins-SemiBold", size: 8))
                                                .foregroundColor(.black)
                                            
                                        }
                                        
                                    }
                                
                            }
                            .frame(width: 90, height: 20)
                            
                            .padding()
                        }
                        .overlay(alignment: .top) {
                            HStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 40, height: 12)
                                    .foregroundColor(CustomColor.yellow)
                                    .overlay (alignment: .center) {
                                        Text(recipe.time)
                                            .font(.custom("Poppins-Medium", size: 8))
                                            .foregroundColor(.black)
                                        
                                    }
                                
                                Spacer()
                                
                                Button {
                                    
//                                    recipeVM.deleteRecipe(index: recipes.firstIndex(where: { $0.name == recipe.name })!)
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .font(.custom("Poppins-SemiBold", size: 10))
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 90, height: 20)
                            .padding()
                        }
                } placeholder: {
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                        .overlay(alignment: .bottom) {
                            Text(recipe.name)
                                .multilineTextAlignment(.leading)
                                .font(.custom("Poppins-SemiBold", size: 12))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 0)
                                .frame(width: 100, height: 20)
                                .truncationMode(.tail)
                        }
                        
                        
                }
            } else {
                Image(uiImage: recipe.image)
                    .resizable()
                    .scaledToFill()
                    .overlay(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom)
                            ).opacity(0.8)
                    }
                    .overlay(alignment: .bottom) {
                        
                        HStack {
                            Text(recipe.name)
                                .multilineTextAlignment(.leading)

                                .font(.custom("Poppins-SemiBold", size: 10))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 0)
                                .truncationMode(.tail)
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 40, height: 12)
                                .foregroundColor(.white)
                                .overlay (alignment: .center) {
                                    HStack (alignment: .center, spacing: 4) {
                                        Image(systemName: "heart")
                                            .foregroundColor(.black)
                                            .font(.system(size: 8))
                                        Text(String(recipe.likes))
                                            .font(.custom("Poppins-SemiBold", size: 8))
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }

                        }
                        .frame(width: 130, height: 20)

                        .padding()
                    }
                    .overlay (alignment: .topLeading) {
                        if !recipe.time.isEmpty {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 40, height: 12)
                                .foregroundColor(CustomColor.yellow)
                                .overlay (alignment: .center) {
                                    Text(recipe.time)
                                        .font(.custom("Poppins-Medium", size: 8))
                                        .foregroundColor(.black)
                                    
                                }
                                .frame(width: 120)
                                .padding()
                        }
                        
                    }
            }
            
        
        }
        
        .frame(width: 120, height: 120)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct RecipeCardSmall_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardSmall(recipe: Recipe.all[8], recipes: Recipe.all)
    }
}
