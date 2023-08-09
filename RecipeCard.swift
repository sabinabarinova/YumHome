//
//  RecipeCard.swift
//  Rec
//
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            
            if !recipe.imageLink.isEmpty {
                AsyncImage(url: URL(string: recipe.imageLink)){image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
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
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 40, height: 12)
                                .foregroundColor(CustomColor.yellow)
                                .overlay (alignment: .center) {
                                    Text(recipe.time)
                                        .font(.custom("Poppins-Medium", size: 8))
                                        .foregroundColor(.black)
                                    
                                }
                                
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
        
        .frame(width: 160, height: 160)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.all[8])
    }
}
