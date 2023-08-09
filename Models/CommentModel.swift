//
//  CommentModel.swift
//  Rec
//
//  Created by Adil Meirambek on 16.05.2023.
//

import Foundation
struct Comment: Identifiable {
    let id = UUID()
    let commentText: String
    let author: User
    let recipeCommented: Recipe
}
