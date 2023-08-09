

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var tabSelection = 1
    @State private var isLinkActive = false
    @State var isTTT = false
    
    
    var body: some View {
        if userIsLoggedIn {
            TabView(selection: $tabSelection) {
                HomeView().tag(1)
                CategoriesView(categories: Category.allCases,  searchQuery: "").tag(2)
                AddRecipeView().tag(3)

                SavedView(categories: Category.allCases, searchQuery: "").tag(4)
                ProfileView(user: User.users[0], recipes: Recipe.all).tag(5)
            }
            .overlay(alignment: .bottom) {
                TabBar(tabSelection: $tabSelection)
            }
        } else {
            
                NavigationView {
                    ZStack {
                    
                        VStack (spacing: 144) {
                            VStack(alignment: .trailing, spacing: -16) {
                                Text("YumHome")
                                    .font(.custom("Damion", size: 60))
                                
                                Text("Inspire & Cook")
                                    .font(.custom("Poppins Bold", size: 18))
                                    .foregroundColor(CustomColor.green)
                            }
                            
                            VStack (spacing: 24) {
                                Text("Login")
                                    .foregroundColor(.black)
                                    .font(.custom("Poppins-Bold", size: 24))
                                .padding(.leading, -170)
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 350, height: 60)
                                    .foregroundColor(.gray.opacity(0.2))
                                    .overlay(
                                        HStack {
                                            TextField("", text:  $email)
                                                .foregroundColor(.black)
                                                .textFieldStyle(.plain)
                                                .autocapitalization(.none)
                                                .placeholder(when: email.isEmpty) {
                                                    Text("Email")
                                                        .foregroundColor(.gray)
                                                        .font(.custom("Poppins-Light", size: 16))
                                                }
                                                .padding()
                                            Image(systemName: "envelope")
                                                .foregroundColor(.gray)
                                                .padding()
                                                .font(.custom("Poppins-Light", size: 18))
                                        }
                                            
                                            
                                        
                                        
                                    )
                                
                                VStack (alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 350, height: 60)
                                        .foregroundColor(.gray.opacity(0.2))
                                        .overlay(
                                            HStack {
                                                SecureField("", text: $password)
                                                    .foregroundColor(.black)
                                                    .textFieldStyle(.plain)
                                                    .autocapitalization(.none)
                                                    .placeholder(when: password.isEmpty) {
                                                        Text("Password")
                                                            .foregroundColor(.gray)
                                                            .font(.custom("Poppins-Light", size: 16))
                                                    }
                                                    .padding()
                                                
                                                Image(systemName: "lock")
                                                    .foregroundColor(.gray)
                                                    .padding()
                                                    .font(.custom("Poppins-Light", size: 18))
                                                
                                            }
                                    )
                                    Button {
                                        
                                    } label: {
                                        Text("Forgot your password?")
                                            .foregroundColor(CustomColor.green)
                                    }
                                }
                                
                                
                            }
                            
                            VStack {
                                
                                Button {
                                    login()
                                } label: {
                                    Text("SIGN IN")
                                        .font(.custom("Poppins-SemiBold", size: 20))
                                        .bold()
                                        .frame(width: 200, height: 40)
                                        .background(
                                            RoundedRectangle(cornerRadius: 32)
                                                .frame(width: 248, height: 64)
                                                .foregroundColor(.black)
                                        )
                                        .foregroundColor(.white)
                                }
                                
                                NavigationLink(destination: AuthorizationView(), isActive: $isLinkActive) {
                                    
                                    Button {
                                        self.isLinkActive = true
                                    } label: {
                                        Text("Don't have an account? ")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .foregroundColor(.black)
                                        + Text("Sign up").underline()
                                            .font(.custom("Poppins-SemiBold", size: 16))
                                            .foregroundColor(CustomColor.green)
                                        
                                    }
                                    .padding()

                                }
                                
                            }

                        }
                        
                        .padding(.top, 56)
                        .frame(width: 350)
                        .onAppear {
                            Auth.auth().addStateDidChangeListener {auth, user in
                                if user != nil {
                                    userIsLoggedIn.toggle()
                                    ContentView(userIsLoggedIn: userIsLoggedIn)

                                }
                            }
                            
                        }
                        
                        
                        
                    }
                    
                    .ignoresSafeArea()
                }
                .navigationBarHidden(true)
                
            }
        }
    func login() {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                
            }
        }
    }
    
}
    
    
   
    



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

