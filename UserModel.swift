//
//  UserModel.swift
//  Rec
//
//  Created by Adil Meirambek on 06.05.2023.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let fullName: String
    let username: String
    let imageLink: String
    let image: UIImage
    let dateOfBirth: Date
    let phoneNum: String
    let email: String
    let password: String
    let comments: [Comment]
    let recipesPosted: [Recipe]
    let recipeSaved: [Recipe]
    let recipeLiked: [Recipe]
}

extension User {
    static let users: [User] = [
        User (
            fullName: "Sabina Barinova",
            username: "sabinabbb",
            imageLink: "https://cdn3.vectorstock.com/i/1000x1000/31/77/beautiful-latin-woman-avatar-character-icon-vector-33983177.jpg",
            image: UIImage(),
            dateOfBirth: Date.now,
            phoneNum: "+7 700 111 22 33",
            email: "sabinabbb01@gmail.com",
            password: "qwerty1!",
            comments: [],
            recipesPosted: [
                Recipe.all[0],
                Recipe.all[1],
                Recipe.all[2],
                Recipe.all[3],
                Recipe.all[4],
                Recipe.all[5],
                ],
            recipeSaved: [],
            recipeLiked: []
        ),
        User (
            fullName: "ItalianFoodLover",
            username: "italian_food_lover",
            imageLink: "https://media.istockphoto.com/id/1330509149/nl/vector/italian-pizza.jpg?s=1024x1024&w=is&k=20&c=3va6BrubXJS62rKxPdTAhp0i3d_08CrExANbliwlqKs=",
            image: UIImage(),
            dateOfBirth: Date.now,
            phoneNum: "+7 700 111 22 33",
            email: "ifl@gmail.com",
            password: "qwerty1!",
            comments: [],
            recipesPosted: [
                Recipe.all[6]
                ],
            recipeSaved: [],
            recipeLiked: []
        ),

        User (
            fullName: "Jeanine Donofrio",
            username: "love.and.lemons",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2023/01/IMG_41499-layers.jpg",
            image: UIImage(),
            dateOfBirth: Date.now,
            phoneNum: "+7 700 111 22 33",
            email: "jean_don@gmail.com",
            password: "qwerty1!",
            comments: [],
            recipesPosted: [
                Recipe.all[7],
                Recipe.all[8],
                Recipe.all[9]
                
                ],
            recipeSaved: [],
            recipeLiked: []
        ),

        
    ]
}

struct FamousCook: Identifiable {
    let id = UUID()
    let name: String
    let imageLink: String
}


extension FamousCook {
    
    static let allCooks: [FamousCook] = [
        FamousCook(
            name: "Jamie Oliver",
            imageLink: "https://thehappyfoodie.co.uk/wp-content/uploads/2021/05/jamie-oliver-headshot-close.jpg"
        ),
        FamousCook(
            name: "Gordon Ramsay",
            imageLink: "https://images.lifestyleasia.com/wp-content/uploads/sites/3/2021/06/01125429/129305145_378999043204329_6799470558229249305_n.jpg"
        ),
        FamousCook(
            name: "Art Smith",
            imageLink: "https://jbf-media.s3.amazonaws.com/production/event/2019/5/3/06.28.Smith.Art.final.jpg"
        ),
        FamousCook(
            name: "Rick Stein",
            imageLink: "https://i.guim.co.uk/img/media/024d473d8b07cd7e8c23a7b19a806ef14af6ead5/0_293_4984_2991/master/4984.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=410fd8be8bbf0e036e7e4a284d124a3d"
        ),
        FamousCook(
            name: "Rachael Ray",
            imageLink: "https://m.media-amazon.com/images/M/MV5BODc1MjZhOTEtYjY0YS00YjAxLTk1NDktNTFiMzZkMTdkZDBjXkEyXkFqcGdeQXVyMTI3MDY1NTY4._V1_FMjpg_UX1000_.jpg"
        ),
        FamousCook(
            name: "Michael Caines",
            imageLink: "https://www.irishtimes.com/resizer/hCvA5r9LgXRj57SbJ34tevKmyIE=/1600x1600/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/irishtimes/VGEKAWIRFYFAMIFCPWSS64GLC4.jpg"
        ),
        FamousCook(
            name: "Daniya Altayeva",
            imageLink: "https://yt3.googleusercontent.com/ytc/AGIKgqPf2HLHet9OyPCuoFpHYTLJAl8OC8ZzCpwqzPB1=s900-c-k-c0x00ffffff-no-rj"
        ),
        FamousCook(
            name: "Alibek Pardaev",
            imageLink: "data:image/jpeg;base64,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"
        ),
        FamousCook(
            name: "Juliya Vysotskaya",
            imageLink: "https://mega-stars.ru/img/actresses/block_pictures/yuliya-vysotskaya.jpg"
        )
        
    
    ]
}

