//
//  RecipeModel.swift
//  Rec
//
//  Created by Adil Meirambek on 22.01.2023.
//

import Foundation
import SwiftUI



enum Category: String, CaseIterable, Identifiable {
    var id: String {self.rawValue}
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
    case main = "Main Course"
    case side = "Side dish"
    case snack = "Snack"
    case appetizer = "Appetizer"
    case soup = "Soup"
    case salad = "Salad"
    case quick = "Quick"
    case fancy = "Fancy"
    case vegan = "Vegan"
    case vegeterian = "Vegeterian"
    case drink = "Drink"
    case asian = "Asian"
    case european = "European"
    case western = "Western"
    case eastern = "Eastern"
    case fastfood = "Fast Food"
    
    
    var image: Image {
        switch self {
        case .breakfast: return Image("\(self)")
        case .lunch: return Image("\(self)")
        case .dinner: return Image("\(self)")
        case .dessert: return Image("\(self)")
        case .main: return Image("\(self)")
        case .side: return Image("\(self)")
        case .snack: return Image("\(self)")
        case .appetizer: return Image("\(self)")
        case .soup: return Image("\(self)")
        case .salad: return Image("\(self)")
        case .quick: return Image("\(self)")
        case .fancy: return Image("\(self)")
        case .vegan: return Image("\(self)")
        case .vegeterian: return Image("\(self)")
        case .drink: return Image("\(self)")
        case .asian: return Image("\(self)")
        case .european: return Image("\(self)")
        case .western: return Image("\(self)")
        case .eastern: return Image("\(self)")
        case .fastfood: return Image("\(self)")
            
        }
        
    }
}

enum Difficulty: String, CaseIterable, Identifiable {
    var id: String {self.rawValue}
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let imageLink: String
    let image: UIImage
    let time: String
    let servings: String
    let difficulty: Difficulty.RawValue
    var rating: Double
    var comments: [Comment]
    var likes: Int
    let description: String
    let ingredients: [String]
    let calories: String
    let protein: String
    let fats: String
    let carbon: String
    let instructions: [String]
    let category: Category.RawValue
    let author: String
    let datePosted: Date
    let url: String
    
    //    mutating func Liking() {
    //        likes += 1
    //    }
    
}

extension Recipe {
    
    static let all: [Recipe] = [
        Recipe (
            name: "Creamy Vegan Chili Mac",
            imageLink: "https://img.taste.com.au/m2RFSODP/w720-h480-cfill-q80/taste/2018/04/may-18_basic-mac-cheese-136957-1.jpg",
            image: UIImage(),
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 4.8,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "Main Course",
            author: "Sabina Barinova",
            datePosted: Date(timeIntervalSinceNow: -9 * 60 * 60 * 24),
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "One-pot tomato pasta recipe",
            imageLink: "https://realfood.tesco.com/media/images/1400x919-tomato-pasta-6a5a3c8e-f111-490d-805c-9b62fbec8691-0-1400x919.jpg",
            image: UIImage(),
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 4.0,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "Side dish",
            author: "Sabina Barinova",
            datePosted: Date(timeIntervalSinceNow: -8 * 60 * 60 * 24),
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "Cream Vegan Chili Mac",
            imageLink: "https://realfood.tesco.com/media/images/1400x919-tomato-pasta-6a5a3c8e-f111-490d-805c-9b62fbec8691-0-1400x919.jpg",
            image: UIImage(),
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 5.0,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "European",
            author: "Sabina Barinova",
            datePosted: Date(),
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "Creamy Vegan Chili Mac",
            imageLink: "https://rainbowplantlife.com/wp-content/uploads/2020/11/Chilimac-dinnerscenecloseup281of129.jpg",
            image: UIImage(),
            
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 4.8,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "Lunch",
            author: "Sabina Barinova",
            datePosted: Date(timeIntervalSinceNow: -10 * 60 * 60 * 24),
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "Creamy Vegan Chili Mac",
            imageLink: "https://www.theseasonedmom.com/wp-content/uploads/2022/05/Chili-Mac-7.jpg",
            image: UIImage(),
            
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 4.2,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "Dinner",
            author: "Sabina Barinova",
            datePosted: Date(timeIntervalSinceNow: -11 * 60 * 60 * 24),
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "Creamy Vegan  Mac",
            imageLink: "https://rainbowplantlife.com/wp-content/uploads/2020/11/1_creamy2Bpantry2Bpasta2B2852Bof2B629-500x500.jpg",
            image: UIImage(),
            
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 4.4,
            comments: [],
            likes: 100,
            description: "A family-friendly FOK favorite, this cheesy chili mac is great for filling hungry tummies with healthy ingredients that taste like a special treat. Macaroni noodles are simmered with beans, diced tomatoes, and a slew of Southwest spices to make a delightful meat-free chili that’s enhanced with extra fiber and nutrients thanks to frozen peas and carrots. A hearty drizzle of vegan cheese sauce takes this dish over the top, and it’s more than likely your little ones will lick the bowl when they’re done. Great for busy weekdays where you only have half an hour to get dinner on the table, this creamy chili mac will satisfy both kids and adults alike!",
            ingredients: [
                "3 cups dry whole grain macaroni or spirals",
                "3 cups low-sodium vegetable broth or water",
                "½ of a 15-oz. can no-salt-added pinto beans, rinsed and drained (¾ cup)",
                "½ of a 15-oz. can no-salt-added black beans, rinsed and drained (¾ cup)",
                "1 14.5-oz. can no-salt-added petite diced tomatoes, undrained",
                "18-oz. can no-salt-added tomato sauce",
                "1 tablespoon dried minced onion",
                "1 tablespoon chili powder",
                "1 teaspoon dried oregano",
                "½ teaspoon garlic powder",
                "2 cups frozen peas and carrots",
                "Sea salt to taste",
                "½ cup Vegan Potato “Cheese” Sauce",
                "¼ cup sliced scallions"
            ],
            calories: "564",
            protein: "15",
            fats: "15",
            carbon: "15",
            instructions: [
                "Put the first 10 ingredients (through garlic powder) in a 5- to 6-quart pot. Stir to mix.",
                "Put pot on burner and turn the burner to medium-high. When the mixture starts to boil, turn heat down to low.",
                "Add lid to pot and simmer 10 minutes.",
                "Add the peas and carrots; stir to mix.",
                "Cover and cook 5 minutes more or until macaroni is tender.",
                "Sprinkle with a little salt.",
                "Meanwhile, make Vegan Potato “Cheese” Sauce. Use a spoon to serve chili mac.",
                "Drizzle sauce on each serving and sprinkle with scallions."
            ],
            category: "Vegan",
            author: "Sabina Barinova",
            datePosted: Date.now,
            url:"https://www.forksoverknives.com/recipes/vegan-pasta-noodles/creamy-vegan-chili-mac/"
        ),
        Recipe (
            name: "Spaghetti Bolognese",
            imageLink: "https://bakingmischief.com/wp-content/uploads/2022/02/fast-bolognese-square-2.jpg",
            image: UIImage(),
            time: "30 min",
            servings: "4",
            difficulty: "Medium",
            rating: 5.0,
            comments: [],
            likes: 100,
            description: "Classic Italian pasta dish with meat sauce. Our best ever spaghetti bolognese is super easy and a true Italian classic with a meaty, chilli sauce. This pasta bolognese recipe is sure to become a family favourite.",
            ingredients:
                [
                    "8 ounces spaghetti",
                    "1 tablespoon olive oil",
                    "1 onion, chopped",
                    "2 cloves garlic, minced",
                    "1 pound ground beef",
                    "1 can crushed tomatoes",
                    "1/4 cup tomato paste",
                    "1/2 cup beef broth",
                    "1 teaspoon dried basil",
                    "1 teaspoon dried oregano",
                    "Salt and pepper to taste",
                    "Grated Parmesan cheese for serving"
                ],
            calories: "500",
            protein: "25",
            fats: "15",
            carbon: "70",
            instructions:
                [
                    "Cook spaghetti according to package instructions. Drain and set aside.",
                    "In a large skillet, heat olive oil over medium heat. Add chopped onion and minced garlic. Sauté until softened.",
                    "Add ground beef to the skillet and cook until browned. Drain excess fat.",
                    "Stir in crushed tomatoes, tomato paste, beef broth, dried basil, dried oregano, salt, and pepper. Simmer for 15-20 minutes.",
                    "Serve the meat sauce over cooked spaghetti. Sprinkle with grated Parmesan cheese."
                ],
            category: "European",
            author: "ItalianFoodLover",
            datePosted: Date.now,
            url: "https://example.com/recipes/spaghetti_bolognese"
        ),
        Recipe(
            name: "Simple Green Salad",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-recipes.jpg",
            image: UIImage(),
            time: "29 min",
            servings: "4",
            difficulty: "Easy",
            rating: 4.0,
            comments: [],
            likes: 131,
            description: "This green salad recipe is simple, but it's still packed with delicious textures and flavors. It's a perfect side dish - you can serve it with almost anything!",
            ingredients:
                [
                    "2 small heads of soft lettuce, butter lettuce or similar",
                    "Lemon Vinaigrette, half recipe",
                    "1 Persian cucumber, thinly sliced",
                    "¼ cup shaved Parmesan cheese",
                    "2 tablespoons pepitas",
                    "1 avocado, thinly sliced",
                    "¼ cup microgreens",
                    "Flaky sea salt, optional",
                    "½ cup raw almonds",
                    "½ tablespoon tamari"
                ],
            calories: "500",
            protein: "25",
            fats: "15",
            carbon: "70",
            instructions:
                [
                    "Roast the almonds: Preheat the oven to 350°F and line a baking sheet with parchment paper. Place the almonds on the sheet and toss with tamari. Bake for 10 to 14 minutes or until browned. Remove from the oven and let cool for 5 minutes.",
                    "Assemble the salad. In a large bowl toss the lettuce with a few spoonfuls of the dressing. Add the cucumber, parmesan, pepitas, avocado, and tamari almonds. Drizzle with more dressing and top with microgreens. Season to taste with flaky sea salt, if desired.",
                    "Add ground beef to the skillet and cook until browned. Drain excess fat.",
                    "Stir in crushed tomatoes, tomato paste, beef broth, dried basil, dried oregano, salt, and pepper. Simmer for 15-20 minutes.",
                    "Serve the meat sauce over cooked spaghetti. Sprinkle with grated Parmesan cheese."
                ],
            category: "Salad",
            author: "Jeanine Donofrio",
            datePosted: Date.now,
            url: "https://www.loveandlemons.com/green-salad-recipe/"
        ),
        Recipe(
            name: "Maki Sushi",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2019/01/maki-sushi-recipe.jpg",
            image: UIImage(),
            time: "1h 20 min",
            servings: "2",
            difficulty: "Medium",
            rating: 5.0,
            comments: [],
            likes: 130,
            description: "Fun & fresh maki sushi rolls made with brown rice, roasted shiitakes, cabbage, cucumber, avocado, and a tangy carrot-ginger dipping sauce.",
            ingredients:
                [
                    "6 ounces shiitake mushrooms",
                    "1 tablespoon extra-virgin olive oil",
                    "1 tablespoon tamari",
                    "⅓ to ½ cup water",
                    "½ cup chopped roasted carrots, about ¾ cup raw carrots",
                    "¼ cup extra-virgin olive oil",
                   "2 tablespoons rice vinegar",
                    "2 teaspoons minced ginger",
                    "¼ teaspoon sea salt",
                    "1 cup short grain brown rice, rinsed well",
                    "2 cups water",
                    "1 teaspoon extra-virgin olive oil",
                    "2 tablespoons rice vinegar",
                    "1 tablespoon cane sugar",
                    "1 teaspoon sea salt",
                    "3 nori sheets",
                    "1 cup thinly sliced red cabbage",
                    "3 long thin strips of cucumber",
                    "½ avocado, sliced into strips",
                    "Sesame seeds, for sprinkling",
                    "Tamari, for serving",
                    "Pickled ginger, optional, for serving"
                    
                   
                ],
            calories: "500",
            protein: "25",
            fats: "15",
            carbon: "70",
            instructions:
                [
                    "Prepare the roasted shiitakes: Preheat the oven to 400°F and line a large and small baking sheet with parchment paper. Toss the shiitake mushrooms with the olive oil and tamari and toss to coat. Spread in an even layer on the large baking sheet. Roast for 25 to 30 minutes or until browned around the edges. On the second sheet, roast the carrots for the dipping sauce.",
                    "Make the carrot ginger dipping sauce: In a blender, combine the roasted carrots, water, olive oil, rice vinegar, ginger, and salt and blend until creamy. Chill until ready to use and set aside the shiitakes until you're ready to roll.",
                    "Make the sushi rice: In a medium saucepan, combine the rice, water, and olive oil and bring to a boil. Cover, reduce the heat, and simmer for 45 minutes. Remove the rice from heat and let sit, covered, for 10 more minutes. Fluff with a fork and fold in the rice vinegar, sugar, and salt. Cover until ready to use.",
                    "SAssemble the maki sushi rolls. Place a small bowl of water and a kitchen towel near your work area as your hands will get sticky. Place one nori sheet, glossy side down, onto a bamboo mat and press a handful of rice onto the lower two-thirds of the sheet. At the bottom of the rice place your toppings (see picture). Don’t overfill or it will be more difficult to roll. Use the bamboo mat to tuck and roll the nori. Once rolled, use the bamboo mat to gently press and shape the roll. Place the roll to the side, cut side down. Repeat with remaining rolls.",
                    "Use a sharp chef’s knife to cut the sushi. Wipe the knife clean with a damp towel between cuts.",
                    "Sprinkle with sesame seeds. Serve with the dipping sauce, tamari, and pickled ginger, if desired."
                ],
            category: "Asian",
            author: "Jeanine Donofrio",
            datePosted: Date.now,
            url: "https://www.loveandlemons.com/maki-sushi-recipe/"
        ),
        Recipe(
            name: "Steakhouse Burgers",
            imageLink: "https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg",
            image: UIImage(),
            time: "50 min",
            servings: "8",
            difficulty: "Easy",
            rating: 5.0,
            comments: [],
            likes: 100,
            description: "Replicate your favorite steakhouse burgers at home — these are packed with flavor and reliably juicy, even when cooked to well-done.",
            ingredients:
                [
                    "2 pieces white sandwich bread, crusts removed and cut into ¼-inch pieces",
                    "⅓ cup milk",
                    "2½ teaspoons kosher salt",
                    "1 teaspoon freshly ground black pepper",
                    "3 garlic cloves, minced",
                    "1½ tablespoons Worcestershire sauce",
                    "2 tablespoons ketchup",
                    "3 pounds 80 to 85% lean ground beef",
                    "3 scallions, white and green parts, very finely sliced (optional)",
                    "8 hamburger buns",

                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "Begin by making the panade. In a large bowl, mash 2 pieces of white sandwich bread (cut into small pieces) and 1/3 cup milk together with a fork until it forms a chunky paste.",
                    "Add 2-1/2 teaspoons kosher salt, 1 teaspoon freshly ground black pepper, 3 minced garlic cloves, 1-1/2 tablespoons Worcestershire sauce and 2 tablespoons of ketchup.",
                    "Stir until well combined.",
                    "Add 3 pounds of 85% lean ground beef and 3 finely sliced scallions (if using). Mix everything together until just combined.",
                    "Divide the mixture into 8 equal portions and shape into balls. ",
                    "Flatten each ball into a 3/4-inch-thick patty that’s about 4-1/2 inches across. (Keeping the burgers thick ensures a nice char on the outside without overcooking the inside.) To prevent the burgers from forming a domed shape on the grill, create a slight depression in the center of each patty.",
                    "Grill the burgers 2 to 4 minutes on the first side until nicely browned. Flip and cook on the second side a few minutes more, until desired doneness is reached. The panade in these burgers keeps the meat tender and juicy, even when overcooked, so these burgers are ideal for kids, the elderly, pregnant women, or anyone who just prefers their burgers well done."
                ],
            category: "Western",
            author: "Jeanine Donofrio",
            datePosted: Date.now,
            url: "https://www.onceuponachef.com/recipes/steakhouse-burgers.html"
        ),
        
        Recipe(
            name: "Veggie Breakfast Tacos",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2019/09/breakfast.jpg",
            image: UIImage(),
            time: "25 min",
            servings: "4",
            difficulty: "Easy",
            rating: 4.98,
            comments: [],
            likes: 100,
            description: "These healthy breakfast tacos are my favorite way to start the day. Fresh & light, they're easy to make, but they're packed with flavor.",
            ingredients:
                [
                    "1 large yellow tomato, diced",
                    "3 tablespoons diced red onion",
                    "3 tablespoons chopped cilantro",
                    "½ to 1 serrano pepper, thinly sliced",
                    "1 garlic clove, minced",
                    "juice from ½ lime",
                    "¼ teaspoon sea salt",
                    "1 green pepper, cored, stem removed, and diced",
                    "3 scallions, chopped",
                    "6 eggs, beaten",
                    "2 cups arugula or spinach, chopped",
                    "extra-virgin olive oil, for drizzling",
                    "sea salt and freshly ground black pepper",
                    "8 tortillas, corn, flour, wheat - whatever you like",
                    "¼ cup chopped cilantro, more for garnish",
                    "1 avocado, sliced",
                    "lime wedges",


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "Make the Salsa: In a small bowl, combine the tomato, onion, cilantro, serrano, garlic, lime juice and salt. Chill until ready to use.",
                    "In a small nonstick skillet, heat a drizzle of olive oil over medium heat. Add the green pepper, scallions and a pinch of salt and pepper and sauté until lightly browned, about 5 minutes. Scoop a large spoonful of the salsa into the pepper mixture and stir. Remove from the heat and set aside.",
                    "Brush a large nonstick stick skillet lightly with olive oil and bring to medium heat. Add the eggs, let them cook for a few seconds and then stir. Add the green pepper mixture to the eggs. Continue to stir and scramble the eggs until just set. Remove from the pan from the heat while the eggs are slightly runny and stir in the arugula and half of the extra cilantro.",
                    "Assemble the tacos with the egg mixture, a scoop of salsa, the remaining cilantro and a few slices of avocado. Finish with a squeeze of lime and a pinch of salt and pepper, if desired. Garnish with cilantro and serve with lime wedges.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date.now,
            url: "https://www.loveandlemons.com/healthy-breakfast-ideas/#wprm-recipe-container-43041"
        ),
        
        Recipe(
            name: "Vegan Banana Pancakes",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2019/03/banana-pancakes.jpg",
            image: UIImage(),
            time: "25 min",
            servings: "1",
            difficulty: "Easy",
            rating: 4.88,
            comments: [],
            likes: 100,
            description: "These whole grain vegan banana pancakes are a delicious, healthy breakfast or brunch! They're soft and fluffy, easy to make, and warmly spiced with cinnamon and nutmeg.",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date.now,
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Baked Oatmeal",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2023/05/baked-oatmeal-recipe.jpg",
            image: UIImage(),
            time: "25 min",
            servings: "4",
            difficulty: "Easy",
            rating: 4.88,
            comments: [],
            likes: 100,
            description: "These whole grain vegan banana pancakes are a delicious, healthy breakfast or brunch! They're soft and fluffy, easy to make, and warmly spiced with cinnamon and nutmeg.",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -4 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Instant Pot Steel Cut Oats",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2022/02/instant-pot-steel-cut-oats-1.jpg",
            image: UIImage(),
            time: "35 min",
            servings: "4",
            difficulty: "Easy",
            rating: 4.88,
            comments: [],
            likes: 100,
            description: "This Instant Pot steel-cut oats recipe is my favorite way to cook oatmeal! It's quick, easy, and hands-off, and the oats turn out perfectly every time. Pile them with toppings like nuts and fresh fruit for a delicious healthy breakfast!",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -1 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Brioche breakfast bake with crispy bacon",
            imageLink: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/brioche-breakfast-bake-with-crispy-bacon-7bf0b52.jpg?quality=90&webp=true&resize=440,400",
            image: UIImage(),
            time: "50 min",
            servings: "5",
            difficulty: "Easy",
            rating: 4.98,
            comments: [],
            likes: 100,
            description: "Originally from North Africa, shakshuka is a popular breakfast food throughout the Middle East. This recipe is simple and satisfying, featuring eggs poached in a harissa-spiced tomato sauce. Serve it with pita or crusty bread for breakfast, brunch, or dinner!",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -2 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Shakshuka",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2017/01/shakshuka.jpg",
            image: UIImage(),
            time: "35 min",
            servings: "4",
            difficulty: "Easy",
            rating: 4.98,
            comments: [],
            likes: 100,
            description: "Originally from North Africa, shakshuka is a popular breakfast food throughout the Middle East. This recipe is simple and satisfying, featuring eggs poached in a harissa-spiced tomato sauce. Serve it with pita or crusty bread for breakfast, brunch, or dinner!",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -6 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Austin-Style Migas",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2020/09/migas-recipe.jpg",
            image: UIImage(),
            time: "10 min",
            servings: "2",
            difficulty: "Easy",
            rating: 4.98,
            comments: [],
            likes: 100,
            description: "When I miss Austin, I make this migas recipe for breakfast. Made with a handful of basic ingredients, it's fun, flavorful, and easy to make!",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -3 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        ),
        
        Recipe(
            name: "Breakfast Burrito",
            imageLink: "https://cdn.loveandlemons.com/wp-content/uploads/2019/06/breakfast-burrito.jpg",
            image: UIImage(),
            time: "45 min",
            servings: "3",
            difficulty: "Medium",
            rating: 4.98,
            comments: [],
            likes: 100,
            description: "Originally from North Africa, shakshuka is a popular breakfast food throughout the Middle East. This recipe is simple and satisfying, featuring eggs poached in a harissa-spiced tomato sauce. Serve it with pita or crusty bread for breakfast, brunch, or dinner!",
            ingredients:
                [
                    "1 tablespoon ground flaxseed",
                    "3 tablespoons water",
                    "½ cup mashed banana, about 1 large",
                    "2 tablespoons extra-virgin olive oil, more for brushing",
                    "1 teaspoon vanilla",
                    "¾ cup + 2 tablespoons almond milk, more if needed",
                    "1½ cup whole wheat pastry flour",
                    "½ cup oat flour",
                    "2 teaspoons baking powder",
                    "½ teaspoon baking soda",
                    "1 teaspoon cinnamon",
                    "½ teaspoon nutmeg",
                    "heaping ¼ teaspoon sea salt",
                    "Maple syrup, banana slices, pecans, for serving",
                   


                ],
            calories: "517",
            protein: "37",
            fats: "27",
            carbon: "28",
            instructions:
                [
                    "In a large bowl, combine the flaxseed, water, and banana. Mash and stir until well combined. Let the mixture sit for 5 minutes to thicken.",
                    "Add the olive oil, vanilla, and almond milk and whisk. Add the flour and sprinkle the baking powder, baking soda, cinnamon, nutmeg, and salt evenly over the top. Stir until all the ingredients are combined, but the batter is still a bit lumpy. The batter should be a bit thick, but if it’s too thick to scoop, stir in an additional 1 tablespoon almond milk.",
                    "Heat a nonstick skillet or griddle to medium heat. Brush the skillet with a little olive oil and use a ⅓-cup measuring cup to pour the batter onto the pan. Use the back of the cup to gently spread the batter a little more. Cook the pancakes until bubbles appear, about 1½ minutes, then flip and cook for another 1½ minutes, or until the pancakes are golden brown. Turn the heat to low as needed so that the middles cook without burning the outsides. I usually start with medium heat and move to low heat as my pan starts to hold residual heat after each batch.",
                    "Serve with maple syrup, sliced bananas, and pecans, if desired.",
                   
                ],
            category: "Breakfast",
            author: "Jeanine Donofrio",
            datePosted: Date(timeIntervalSinceNow: -6 * 60 * 60 * 24),
            url: "https://www.loveandlemons.com/vegan-banana-pancakes/#wprm-recipe-container-44757"
        )
        
        
    ]
    
}
