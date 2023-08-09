//
//  DataManager.swift
//  Rec
//
//  Created by Adil Meirambek on 12.05.2023.
//

import SwiftUI
import Firebase

//class DataManager: ObservableObject {
//    @Published var users: [User] = []
//    @Published var recipes: [Recipe] = []
//    @Published var comments: [Comment] = []
//
//
//
//    init() {
//        fetchUsers()
//        fetchRecipes()
//        fetchComments()
//    }
//
//    func fetchComments() {
//
//        comments.removeAll()
//
//        let db = Firestore.firestore()
//        let ref = db.collection("users")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else{
//                print(error!.localizedDescription)
//                return
//            }
//
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let commentText = data["comment"] as? String ?? ""
//                    let recipeCommented = data["recipeCommented"] as? Recipe ?? nil
//                    let author = data["author"] as? User ?? nil
//
//                    let comment = Comment(commentText: commentText, author: author ?? User(fullName: "error", username: "error", imageLink: "error", image: UIImage(systemName: "photo")!, dateOfBirth: Date(), phoneNum: "error", email: "error", password: "error", comments: [], recipesPosted: [], recipeSaved: [], recipeLiked: []), recipeCommented: recipeCommented ?? Recipe(name: "errorRecipe", imageLink: "error", image: UIImage(systemName: "photo")!, time: "errorRecipe", servings: "errorRecipe", difficulty: "errorRecipe", rating: 0, comments: [], likes: 0, description: "errorRecipe", ingredients: [], calories: "errorRecipe", protein: "errorRecipe", fats: "errorRecipe", carbon: "errorRecipe", instructions: [], category: "", author: User(fullName: "error", username: "error", imageLink: "error", image: UIImage(systemName: "photo")!, dateOfBirth: Date(), phoneNum: "error", email: "error", password: "error", comments: [], recipesPosted: [], recipeSaved: [], recipeLiked: []), datePosted: Date(), url: "errorRecipe"))
//
//                    self.comments.append(comment)
//
//
//                }
//            }
//        }
//
//    }
//
//    func fetchRecipes() {
//
//        recipes.removeAll()
//
//        let db = Firestore.firestore()
//        let ref = db.collection("recipes")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else{
//                print(error!.localizedDescription)
//                return
//            }
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let name = data["name"] as? String ?? ""
//                    let time = data["time"] as? String ?? ""
//                    let servings = data["servings"] as? String ?? ""
//                    let imageLink = data["imageLink"] as? String ?? ""
//                    let image = data["image"] as? UIImage ?? UIImage(systemName: "photo")
//                    let difficulty = data["difficulty"] as? String ?? ""
//                    let rating = data["rating"] as? Double ?? 0
//                    let comments = data["comments"] as? [Comment] ?? []
//                    let likes = data["likes"] as? Int ?? 0
//                    let description = data["description"] as? String ?? ""
//                    let ingredients = data["ingredients"] as? [String] ?? []
//                    let calories = data["calories"] as? String ?? ""
//                    let protein = data["protein"] as? String ?? ""
//                    let fats = data["fats"] as? String ?? ""
//                    let carbon = data["carbon"] as? String ?? ""
//                    let instructions = data["instructions"] as? [String] ?? []
//                    let category = data["category"] as? Category.RawValue ?? ""
//                    let author = data["author"] as? User ?? User(fullName: "error", username: "error", imageLink: "error", image: UIImage(systemName: "photo")!, dateOfBirth: Date(), phoneNum: "error", email: "error", password: "error", comments: [], recipesPosted: [], recipeSaved: [], recipeLiked: [])
//                    let datePosted = data["datePosted"] as? Date ?? Date()
//                    let url = data["url"] as? String ?? ""
//
//
//
//                    let recipe = Recipe(
//                        name: name,
//                        imageLink: imageLink,
//                        image: image!,
//                        time: time,
//                        servings: servings,
//                        difficulty: difficulty,
//                        rating: rating,
//                        comments: comments,
//                        likes: likes,
//                        description: description,
//                        ingredients: ingredients,
//                        calories: calories,
//                        protein: protein,
//                        fats: fats,
//                        carbon: carbon,
//                        instructions: instructions,
//                        category: category,
//                        author: author,
//                        datePosted: datePosted,
//                        url:url
//                    )
//                    self.recipes.append(recipe)
//
//
//                }
//            }
//        }
//
//    }
//
//    func fetchUsers() {
//
//        users.removeAll()
//
//        let db = Firestore.firestore()
//        let ref = db.collection("users")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else{
//                print(error!.localizedDescription)
//                return
//            }
//
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let email = data["email"] as? String ?? ""
//                    let password = data["password"] as? String ?? ""
//                    let fullName = data["fullName"] as? String ?? ""
//                    let username = data["username"] as? String ?? ""
//                    let imageLink = data["image"] as? String ?? ""
//                    let dateOfBirth = data["dateOfBirth"] as? Date ?? Date()
//                    let image = data["image"] as? UIImage ?? UIImage(systemName: "person")
//
//                    let phoneNum = data["phoneNum"] as? String ?? ""
//                    let comments = data["comments"] as? [Comment] ?? []
//                    let recipesPosted = data["recipesPosted"] as? [Recipe] ?? []
//                    let recipeSaved = data["recipeSaved"] as? [Recipe] ?? []
//                    let recipeLiked = data["recipeLiked"] as? [Recipe] ?? []
//
//                    let user = User(
//                        fullName: fullName,
//                        username: username,
//                        imageLink: imageLink,
//                        image: image!,
//                        dateOfBirth: dateOfBirth,
//                        phoneNum: phoneNum,
//                        email: email,
//                        password: password,
//                        comments: comments,
//                        recipesPosted: recipesPosted,
//                        recipeSaved: recipeSaved,
//                        recipeLiked: recipeLiked
//                    )
//
//                    self.users.append(user)
//
//
//                }
//            }
//        }
//
//    }
//}

