//
//  RecipeSaver.swift
//  Rec
//
//  Created by Adil Meirambek on 29.01.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct RecipeSaver: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject var recipeViewModel = RecipeViewModel()
//    @StateObject var dataManager = DataManager()
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}



