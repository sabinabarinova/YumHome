//
//  ContentView.swift
//  Rec
//
//  Created by Adil Meirambek on 22.01.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State private var isLogin = false

    var user: User
    @State private var tabSelection = 1
    @State private var hide = true

    var recipes: [Recipe]
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack  {
                    Text("\(user.username)")
                        .font(.custom("Poppins-SemiBold", size: 16))
                    
                    Spacer()

                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName:"globe")
                                .font(.custom("Poppins-SemiBold", size: 16))
                                .foregroundColor(.black)
                        }

                        Button {
                            do {
                                try Firebase.Auth.auth().signOut()
                                
                                isLogin.toggle()
                                

                                
                                
                            } catch {
                                print("error signing out: \(error)")
                                
                            }
                            
                        } label: {
                            Image(systemName:"rectangle.portrait.and.arrow.right")
                                .font(.custom("Poppins-SemiBold", size: 16))
                                .foregroundColor(.black)
                        }

                    .fullScreenCover(isPresented: $isLogin, content: LoginView.init)
                    }
                    
                }
                
                
                
                
                
                .frame(width: 360)
                .padding(.horizontal)
                Divider()
                    .padding(8)
                
                HStack(alignment: .top)  {
                    AsyncImage(url: URL(string: user.imageLink)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width:90, height:90)
                            .overlay {
                                Circle()
                                    .stroke(.black.opacity(0.3))
                                    .frame(width:91, height:91)
                                
                            }
                            .padding(.leading)
                        
                    } placeholder: {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width:90, height:90)
                    }
                    Spacer()
                    HStack (alignment: .center, spacing: 12) {
                        VStack (spacing: 10) {
                            Text("Posts")
                            
                            Text("\(user.recipesPosted.count)")
                        }
                        
                        Divider()
                            .frame(height: 44)
                        
                        VStack (spacing: 10)  {
                            Text("Followers")
                            
                            Text("111")
                            
                        }
                        
                        Divider()
                            .frame(height: 44)
                        
                        
                        VStack (spacing: 10) {
                            Text("Likes")
                            
                            Text("13 245")
                        }
                        
                        
                    }
                    
                }
                .frame(width:360)
                
                Text("\(user.fullName)")
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.leading)
                
                
                
                Divider()
                    .padding(8)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 12) {
                        ForEach(user.recipesPosted) { recipe in
                            
                            NavigationLink(destination: RecipeView(recipe: recipe)) {
                                RecipeCardSmall(recipe: recipe, recipes: recipes)
                                
                            }
                        }
                    }
                }
                
            }
        }
        .navigationBarHidden(true)
    
    
    
}


}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.users[0], recipes: User.users[0].recipesPosted)
            .environmentObject(RecipeViewModel())
        
        
    }
}



