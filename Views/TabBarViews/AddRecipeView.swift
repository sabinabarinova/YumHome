
import SwiftUI
import Firebase
import FirebaseAuth
import PhotosUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: [String] = []
    @State private var instructions: [String] = []
    @State private var author: String = "\(Auth.auth().currentUser?.email)"
    @State private var calories: String = ""
    @State private var protein = 0
    @State private var fats = 0
    @State private var carbon = 0
    @State private var difficulty: Difficulty = Difficulty.easy
    @State private var servings = 0
    @State var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImageData: Data?
    @State private var uiImage: UIImage?
    @State private var minuteSelection = 0
    @State private var hourSelection = 0
    @State private var selectedTime: String = ""
    
    
    var hours = [Int](0..<24)
    var mins = [Int](0..<60)
    
    
    
    @State private var navigateToRecipe = false
    @State private var navigateToHomeView = false
    
//    init(authorFull: User) {
//
//        self.authorFull = authorFull
//

//        }
 
    
    
    func getBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { ingredients[index] },
                               set: { ingredients[index] = $0 })
    }
    
    func getBindingInstructions(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { instructions[index] },
                               set: { instructions[index] = $0 })
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            
            Form {
                
                
                Section(header: Text("Upload Recipe Cover")) {
                    if let data = selectedImageData,  let uiimage = UIImage(data: data) {
                        Image(uiImage: uiimage)
                            .resizable()
                            .scaledToFit()
                            .frame(width:320, height: 220)
                    }
                    else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100, height: 100)
                            .multilineTextAlignment(.center)
                    }
                    PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
                        Text("Upload Recipe Cover")
                    }
                    
                    .onChange(of: selectedItems) { newValue in
                        guard let item = selectedItems.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                selectedImageData = data
                            case .failure(let error):
                                print("Error loading image data: \(error)")
                            }
                        }
                    }
                }
                
                
                
                
                
                
                //
                Section(header: Text("Time")) {
                    
                    GeometryReader { geometry in
                        HStack {
                            Picker(selection: self.$hourSelection, label: Text("")) {
                                ForEach(0 ..< self.hours.count) { index in
                                    Text("\(self.hours[index]) h")
                                    
                                        .tag(index)
                                }
                            }
                            
                            Picker(selection: self.$minuteSelection, label: Text("")) {
                                ForEach(0 ..< self.mins.count) { index in
                                    Text("\(self.mins[index]) min").tag(index)
                                }
                            }
                            
                            
                        }
                        
                    }
                    //                        selectedTime = ("\(hourSelection)" + "h" + "\(minuteSelection)" + "min")
                    
                }
                
                
                
                Section(header: Text("Name")) {
                    TextEditor(text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu )
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Difficulty")) {
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(Difficulty.allCases) { difficulty in
                            Text(difficulty.rawValue)
                                .tag(difficulty)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Servings")) {
                    Stepper("Servings               \(servings)", value: $servings)
                    
                }
                
                Section(header: Text("Nutrition Facts")) {
                    TextField("Calories", text: $calories)
                    
                    Stepper("Protein                 \(protein) g", value: $protein)
                    
                    Stepper("Fats                      \(fats) g", value: $fats)
                    
                    Stepper("Carbs                   \(carbon) g", value: $carbon)
                    
                }
                


                
                
                Section(header: Text("Ingredients")) {
                    ForEach(0..<ingredients.count, id: \.self) { index in
                        HStack {
                            Button(action: { ingredients.remove(at: index) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            TextField("1 cup of sugar", text: getBinding(forIndex: index))
                        }
                    }
                    Button(action: { ingredients.append("") }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .padding(.horizontal)
                            Text("add ingredient")
                        }
                    }
                    
                }
                Section(header: Text("Instructions")) {
                    ForEach(0..<instructions.count, id: \.self) { index in
                        HStack {
                            Button(action: { instructions.remove(at: index) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            TextField("Chop and slice", text: getBindingInstructions(forIndex: index))
                        }
                    }
                    Button(action: { instructions.append("") }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .padding(.horizontal)
                            Text("add instruction")
                        }
                    }
                    
                    
                    // нужна кнопка чтобы добавлять стэпы по отдельности
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(isActive: $navigateToHomeView) {
                        HomeView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Button {
                            dismiss()
                            navigateToHomeView = true
                            
                            
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                            
                        }
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HomeView(), isActive: $navigateToRecipe) {
                        Button {
                            saveRecipe()
                            self.navigateToRecipe = true
                        } label: {
                            Label("Cancel", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty)

                    
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}

extension AddRecipeView {
    private func saveRecipe() {

        let recipe = Recipe (name: name, imageLink: "", image: UIImage(data: selectedImageData ?? Data()) ?? UIImage(systemName: "photo")!, time: ("\(hourSelection)" + "h " + "\(minuteSelection)" + " min"), servings: String(servings), difficulty: difficulty.rawValue, rating: 0, comments: [], likes: 0, description: description, ingredients: ingredients, calories: calories, protein: String(protein), fats: String(fats), carbon: String(carbon), instructions: instructions, category: selectedCategory.rawValue, author: author, datePosted: Date.now, url: "")
        recipeVM.addRecipe(recipe: recipe)
    }
}
