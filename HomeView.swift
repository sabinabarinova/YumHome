

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State private var isLinkActive = false
    @State private var navigateToWholeList = false
    var body: some View {
        
        
        NavigationView {
            
            ScrollView {
                VStack (spacing: 80) {
                    VStack {
                        Image("Frame 4")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 500)
                            .overlay(alignment: .top) {
                                VStack(alignment: .trailing, spacing: -16) {
                                    Text("YumHome")
                                        .font(.custom("Damion", size: 40))
                                    
                                    Text("Inspire & Cook")
                                        .font(.custom("Poppins Bold", size: 12))
                                        .foregroundColor(CustomColor.green)
                                }
                                .padding(.top, 100)
                                
                            }
                        
                        
                            .overlay {
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 312, height: 200)
                                    .foregroundColor(CustomColor.darkGray)
                                    .overlay {
                                        VStack(alignment: .center, spacing: 4) {
                                            VStack(spacing: 4) {
                                                Text("CRAZY DRINKS")
                                                    .font(.custom("Poppins-Bold", size: 12))
                                                    .foregroundColor(.white.opacity(0.5))
                                                
                                                Text("Chef's mocktails")
                                                    .foregroundColor(.white)
                                                    .font(.custom("Damion", size: 32, relativeTo: .title))
                                                Text("Mocktails offer a refreshing and enjoyable drinking experience without the presence of alcohol")
                                                    .foregroundColor(.white)
                                                    .font(.custom("Poppins-Medium", size: 10, relativeTo: .title))
                                                    .multilineTextAlignment(.center)
                                                    .frame(maxWidth: 200)
                                                
                                                
                                            }
                                            .padding()
                                            HStack (spacing: 96) {
                                                Text("Sabina Barinova")
                                                    .font(.custom("Poppins-Light", size: 12))
                                                    .foregroundColor(CustomColor.yellow)
                                                    .frame(maxWidth: 100)
                                                
                                                HStack {
                                                    Image(systemName: "heart")
                                                        .font(.system(size: 18))
                                                        .foregroundColor(CustomColor.yellow)
                                                    
                                                    Text("3200")
                                                        .font(.custom("Poppins-Light", size: 12))
                                                        .foregroundColor(CustomColor.yellow)
                                                    
                                                }
                                                
                                                
                                            }
                                        }
                                        
                                        
                                    }
                                    .offset(y: 200)
                                
                            }
                    }
                    
                    
                    
                    
                    VStack {
                        VStack (spacing: -12) {
                            HStack {
                                Text("Our Latest Recipes")
                                    .font(.custom("Poppins-Semibold", size: 20))
                                    .foregroundColor(.black)
                                Spacer()
                                NavigationLink(isActive: $navigateToWholeList) {
                                    LatestRecipeListView()
                                    
                                } label: {
                                    Button {
                                        navigateToWholeList = true
                                    } label: {
                                        Label("View all", systemImage: "arrow")
                                            .labelStyle(.titleOnly)
                                            .underline()
                                            .foregroundColor(CustomColor.green)
                                            .font(.custom("Poppins-Light", size: 18))
                                            .padding(.leading)
                                        
                                        
                                    }
                                }
                                
                                
                                
                                
                            }
                            .frame(width: 360)
                            
                            

                            ScrollView(.horizontal) {
                                let keyDate = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)
                                LatestRecipeListPreview(recipes: Recipe.all.filter{$0.datePosted > keyDate})
                            }
                            .padding(.leading, 24)
                            .scrollIndicators(.hidden)
                        }

                        
                        VStack (spacing: -12){
                            HStack  {
                                Text("More From")
                                    .font(.custom("Poppins-Semibold", size: 20))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                
                                
                                
                            }
                            .frame(width: 360)
                            ScrollView (.horizontal) {
                                FamousCookList(cooks: recipeVM.cooks)
                                
                            }
                            .padding(.leading, 24)

                            .scrollIndicators(.hidden)
                        }
                        
                        VStack (spacing: -12){
                            HStack  {
                                Text("Today's Favorite")
                                    .font(.custom("Poppins-Semibold", size: 20))
                                    .foregroundColor(.black)
                                Spacer()
                                                                
                                
                                
                            }
                            .frame(width: 360)
                            .padding()
                            
                            NavigationLink(destination: RecipeView(recipe: Recipe.all.max(by: {
                                $0.likes < $1.likes
                            })!)) {
                                RecipeCardBig(recipe: Recipe.all.max(by: {
                                    $0.likes < $1.likes})!)
                            }

                            
                            
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.top, -100)
                //.navigationViewStyle(.stack)
            }
            
        }
        
        
        .navigationBarHidden(true)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}

struct CustomColor {
    static let green = Color("green")
    static let yellow = Color("yellow")
    static let darkGray = Color("darkGray")
    
}
