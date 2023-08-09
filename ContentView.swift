

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var tabSelection = 1
    var userIsLoggedIn = false
    @State private var IsLogOut = false
    
    
    
    
    
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
            OnboardingView()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userIsLoggedIn: false)
            .previewLayout(.device)
            .previewDevice("iPhone 14 Pro")
            .environmentObject(RecipeViewModel())
        
    }
}
