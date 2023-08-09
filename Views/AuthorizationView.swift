//
//  AuthorizationView.swift
//  Rec
//
//  Created by Adil Meirambek on 05.02.2023.
//e

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var phoneNum = ""
    @State private var isOn = false
    @State private var userIsLoggedIn = false
    @State private var tabSelection = 1
    @State private var isLinkActive = false
    @State private var toHomeView = false

    @EnvironmentObject var recipeVM: RecipeViewModel

    var body: some View {
        if userIsLoggedIn {
            TabView(selection: $tabSelection) {
                HomeView().tag(1)
                CategoriesView(categories: Category.allCases, searchQuery: "").tag(2)
                AddRecipeView().tag(3)

                SavedView(categories: Category.allCases, searchQuery: "").tag(4)
                ProfileView(user: User.users[0], recipes: Recipe.all).tag(5)
            }
            .overlay(alignment: .bottom) {
                TabBar(tabSelection: $tabSelection)
            }
        } else {
            content
            //OnboardingView()
        }
    }
    
    var content: some View {
        NavigationView {
            ZStack {
            
                VStack (spacing: 88) {
                
                    VStack(alignment: .trailing, spacing: -16) {
                        Text("YumHome")
                            .font(.custom("Damion", size: 60))
                        
                        Text("Inspire & Cook")
                            .font(.custom("Poppins Bold", size: 18))
                            .foregroundColor(CustomColor.green)
                    }
                    
                    VStack (spacing: 24) {
                        Text("Create an account")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Bold", size: 24))
                            .padding(.leading, -114)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 60)
                            .foregroundColor(.gray.opacity(0.2))
                            .overlay(

                                HStack {
                                    TextField("", text:  $fullName)
                                        .foregroundColor(.black)
                                        .textFieldStyle(.plain)
                                        .placeholder(when: fullName.isEmpty) {
                                            Text("Full name")
                                                .foregroundColor(.gray)
                                                .font(.custom("Poppins-Light", size: 16))
                                        }
                                        .padding()

                                    Image(systemName: "person")
                                        .foregroundColor(.gray)
                                        .padding()
                                        .font(.custom("Poppins-Light", size: 18))
                                }

                            )
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 350, height: 60)
                            .foregroundColor(.gray.opacity(0.2))
                            .overlay(

                                HStack {
                                    TextField("", text:  $phoneNum)
                                        .foregroundColor(.black)
                                        .textFieldStyle(.plain)
                                        .placeholder(when: phoneNum.isEmpty) {
                                            Text("Phone Number")
                                                .foregroundColor(.gray)
                                                .font(.custom("Poppins-Light", size: 16))
                                        }
                                        .padding()

                                    Image(systemName: "phone")
                                        .foregroundColor(.gray)
                                        .padding()
                                        .font(.custom("Poppins-Light", size: 18))
                                }

                            )
                        
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
                                            Text("Valid email")
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
                        
                        
                        Toggle(isOn: $isOn) {
                            Text("By checking the box you agree to our ")
                                .font(.custom("Poppins-Light", size: 10))
                                .foregroundColor(.black)
                            + Text("Terms")
                                .font(.custom("Poppins-Light", size: 12))
                                .foregroundColor(CustomColor.green)
                                .underline()
                            + Text(" and ")
                                .font(.custom("Poppins-Light", size: 10))
                                .foregroundColor(.black)

                            + Text("Conditions")
                                .font(.custom("Poppins-Light", size: 12))
                                .foregroundColor(CustomColor.green)
                                .underline()

                        }
                        .toggleStyle(CheckboxToggle())
                        
                    }
                    
                    VStack {
//                        NavigationLink(destination: HomeView(), isActive: $toHomeView) {
//                            Button {
//                                register()
//                                self.toHomeView = true
//                            } label: {
//                                Text("SIGN UP")
//                                    .font(.custom("Poppins-SemiBold", size: 20))
//                                    .bold()
//                                    .frame(width: 200, height: 40)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 32)
//                                            .frame(width: 248, height: 64)
//                                            .foregroundColor(.black)
//                                    )
//                                    .foregroundColor(.white)
//                            }
//                        }
                        Button {
                            register()
                            self.toHomeView = true
                        } label: {
                            Text("SIGN UP")
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

                        
                        
                        NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                            Button {
                                self.isLinkActive = true
                            } label: {
                                Text("Already have an account? ")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.black)
                                + Text("Sign in").underline()
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
                        }
                        ContentView(userIsLoggedIn: userIsLoggedIn)
                    }
                }
                
                
                
            }
            
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)


    }

    
    func register() {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            recipeVM.addUser(user: User(fullName: fullName, username: "", imageLink: "", image: UIImage(), dateOfBirth: Date.now, phoneNum: phoneNum, email: email, password: password, comments: [], recipesPosted: [], recipeSaved: [], recipeLiked: []))
        }
    }
    

}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}

extension View {
    func placeholder <Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        
        }
}

struct CheckboxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
            // 1
            Button(action: {

                // 2
                configuration.isOn.toggle()

            }, label: {
                HStack {
                    // 3
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                        .foregroundColor(.black)

                    configuration.label
                }
            })
        }
}

extension AuthorizationView {
    private func saveUser() {

        let user = User(fullName: fullName, username: "", imageLink: "", image: UIImage(), dateOfBirth: Date.now, phoneNum: phoneNum, email: email, password: password, comments: [], recipesPosted: [], recipeSaved: [], recipeLiked: [])
        recipeVM.addUser(user: user)
    }
}
