//
//  RecipeView.swift
//  Rec
//
//  Created by Adil Meirambek on 29.01.2023.
//

import SwiftUI

struct RecipeView: View {
    @State var recipe: Recipe

    @EnvironmentObject var recipeVM: RecipeViewModel
    
    @State private var selectedTab: String = "Ingredients"
    @State private var Liked: Bool = false
    @State private var Saved: Bool = false
    @State private var navigatoToProfile: Bool = false
    @State private var isShow: Bool = false
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .font(.custom("Poppins-SemiBold", size: 24))
               
            }
        }
    }
    
    @Environment (\.dismiss) private var dismiss
    
    
    var body: some View {
        ScrollView {
            
            VStack {
                if recipe.imageLink.isEmpty {
                    Image(uiImage: recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 500)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom)
                                ).opacity(0.8)
                                .overlay {
                                    HStack {
                                        Button {
                                            recipe.likes += 1
                                            self.Liked.toggle()
                                        } label: {
                                            Image(systemName: Liked ? "heart.fill" : "heart")
                                                .foregroundColor(Liked ? .red : .white)
                                        
                                    }

                                        

                                    }
                                }
                        }
                    
                } else {
                    AsyncImage(url: URL(string: recipe.imageLink)){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 500)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom)
                                    ).opacity(0.8)
                                    .overlay (alignment: .bottom) {
                                        HStack (alignment: .center) {
                                            Button {
                                                self.Liked.toggle()
                                                if Liked {
                                                    recipe.likes += 1
                                                }
                                                
                                            } label: {
                                                Image(systemName: Liked ? "heart.fill" : "heart")
                                                    .foregroundColor(Liked ? .red : .white)
                                                    .font(.custom("Poppins-SemiBold", size: 24))
                                                
                                            }
                                            
                                            Button {
                                                self.Saved.toggle()
//                                                if Saved {
//                                                    recipe.likes += 1
//                                                }
                                                
                                            } label: {
                                                Image(systemName: Saved ? "bookmark.fill" : "bookmark")
                                                    .foregroundColor(.white)
                                                    .font(.custom("Poppins-SemiBold", size: 24))
                                                
                                            }

                                            
                                            
                                        }
                                        .padding()
                                    }
                            }
                        
                        
                    } placeholder: {
                        ProgressView()
                        
                    }
                    
                }
                
                
            }
            
            
            
            //.edgesIgnoringSafeArea(.all)
            
            
            //
            
            
            
            VStack {
                
                HStack {
                    Text(recipe.name)
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: "clock")
                    Text(recipe.time)
                }
                .frame(width: 340)
                .foregroundColor(.secondary)
                .padding()
                
                Divider()
                    .padding(2)
                    
                
                
                Text(recipe.description)
                    .font(.custom("Poppins-Regular", size: 12))
                    .padding([.top, .bottom])
                    .frame(width: 340)
                
                Divider()
                    .padding(2)
                
                VStack {
                    HStack (alignment: .center, spacing: 80) {
                        HStack (spacing: 12) {
                            Circle()
                                .frame(width: 72, height: 72)
                                .foregroundColor(.gray)
                                .overlay (
                                    Circle()
                                        .stroke(CustomColor.green)
                                        .frame(width: 80, height: 80)
                                )
                            
                            Text(recipe.author)
                                .font(.custom("Poppins-MEDIUM", size: 18))
                            
                        }
                        
                        HStack {
                            
                                Button {
                                    
                                } label: {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                            }
                            
                        }
                    }
                    .frame(width: 340)
                    
                    .padding(.top)
                    
                    Divider()
                        .padding(2)
                    
                    VStack {
                        HStack (alignment: .center, spacing: 40) {
                            VStack {
                                Text("Servings")
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                Text(recipe.servings)
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Circle()
                                            .stroke(CustomColor.green, lineWidth: 2)
                                    )
                            }
                            
                            VStack {
                                Text("Rating")
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                Text(String(recipe.rating))
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Circle()
                                            .stroke(CustomColor.green, lineWidth: 2)
                                    )
                            }
                            
                            
                            VStack {
                                Text("Reviews")
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                Text(String(recipe.comments.count))
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Circle()
                                            .stroke(CustomColor.green, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .padding([.top, .bottom])
                    Divider()
                        .padding(2)
                }
                
                
                
                
                
                
                
                
                
                Text("NUTRITION PER SERVING")
                    .font(.custom("Poppins-MEDIUM", size: 18))
                    .padding(.top)
                HStack (alignment: .center, spacing: 24) {
                    
                    VStack (spacing: 12) {
                        Text("Cal")
                        
                        Text(recipe.calories)
                    }
                    
                    Rectangle()
                        .frame(width: 1, height: 44)
                        .foregroundColor(Color.gray)
                    
                    VStack (spacing: 12)  {
                        Text("Protein")
                        
                        Text("\(recipe.protein) g")
                        
                    }
                    
                    Rectangle()
                        .frame(width: 1, height: 44)
                        .foregroundColor(Color.gray)
                    
                    VStack (spacing: 12) {
                        Text("Fat")
                        
                        Text("\(recipe.fats) g")
                    }
                    
                    Rectangle()
                        .frame(width: 1, height: 44)
                        .foregroundColor(Color.gray)
                    
                    VStack (spacing: 12) {
                        Text("Carb")
                        
                        Text("\(recipe.carbon) g")
                    }
                }
                .padding(.bottom)
                
                Divider()
                    .padding(2)
                    
                
                HStack(spacing: 0) {
                    Button {
                        self.selectedTab = "Ingredients"
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "Ingredients" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                            .overlay {
                                Text("Ingredients")
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                    .foregroundColor(selectedTab == "Ingredients" ? Color.white : Color.black.opacity(0.5))
                                
                            }
                    }
                    
                    Button {
                        self.selectedTab = "Instructions"
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "Instructions" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                            .overlay {
                                Text("Instructions")
                                    .font(.custom("Poppins-MEDIUM", size: 18))
                                    .foregroundColor(selectedTab == "Instructions" ? Color.white : Color.black.opacity(0.5))
                            }
                        
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.secondary.opacity(0.2))
                    
                }
                
                .padding(.top)
                
                Group {
                    if (selectedTab == "Ingredients") {
                        
                        VStack (alignment: .leading)  {
                            ForEach(recipe.ingredients.indices, id: \.self) { index in
                                VStack {
                                    HStack(alignment: .top) {
                                        Text("\(index + 1).")
                                            .font(.custom("Poppins-MEDIUM", size: 16))
                                        Text(recipe.ingredients[index])
                                            .font(.custom("Poppins-MEDIUM", size: 16))
                                        Button {
                                            isShow.toggle()
                                        } label: {
                                            Image(systemName:"questionmark.circle")
                                                .font(.custom("Poppins-MEDIUM", size: 16))
                                                .foregroundColor(.black.opacity(0.5))
                                        }
                                        .IOSPopover(isPresented: $isShow, arrowDirection: .down) {
                                            Text("This ingredient is needed for ..., you can replaced it with ...")
                                                .padding(10)
                                        }
                                        
                                    }
                                    .padding(.leading)
                                }
                                Divider()
                            }
                        }
                        
                        
                    } else {
                        
                        VStack (alignment: .leading) {
                            ForEach(recipe.instructions.indices, id: \.self) { index  in
                                VStack {
                                    HStack(alignment: .top) {
                                        Text("Step \(index + 1).")
                                            .font(.custom("Poppins-MEDIUM", size: 16))
                                        Text(recipe.instructions[index])
                                            .font(.custom("Poppins-MEDIUM", size: 16))
                                        
                                        
                                    }
                                    .padding(.leading)
                                }
                                Divider()
                            }
                        }
                        
                        
                        
                    }
                }
                .frame(width: 340)
                .padding(.top)
                
                
            }
        }
        

            
            
            
            
            
            
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)

            .edgesIgnoringSafeArea(.all)
        
        
        
    }
}

//struct LikeButton: View {
//    @Binding  var didTap: Bool
//
//    var body: some View {
//
//    }
//}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.all[8])
    }
}


extension View {
    @ViewBuilder
    func IOSPopover<Content: View>(isPresented: Binding<Bool>, arrowDirection: UIPopoverArrowDirection, @ViewBuilder content: @escaping()-> Content)-> some View {
        self
            .background {
                PopOverController(isPresented: isPresented, arrowDirection: arrowDirection, content: content())
            }
        
    }
}

struct PopOverController<Content: View>: UIViewControllerRepresentable{
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }

    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented{
            let controller = CustomHostingView(rootView: content)
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections =
            arrowDirection
            controller.presentationController?.delegate = context.coordinator
            controller.popoverPresentationController?.sourceView = uiViewController.view
            uiViewController.present (controller, animated: true)
        }
    }
    
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate{
        var parent: PopOverController
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
    
}

class CustomHostingView<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = view.intrinsicContentSize
    }
}
