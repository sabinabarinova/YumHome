//
//  ContentView.swift
//  Rec
//
//  Created by Adil Meirambek on 22.01.2023.
//

import SwiftUI

struct SavedView: View {
    var categories: Category.AllCases
    @State var searchQuery = ""
    var body: some View {
        NavigationView {
            VStack{

                SearchBarView(searchQuery: $searchQuery)
                    

                ScrollView {
                    
                    LazyVStack  {
                        ForEach(categories.filter({"\($0)".contains(searchQuery.lowercased()) || searchQuery.isEmpty})) { category in
                            NavigationLink(destination: CategoryView(category: category)) {
                                CategoryFolderCard(category: category)
                            }
                           .padding(.top)
                        }
                    }
                    

                    .padding([.top,.bottom])


                }
                .navigationTitle("Saved")
                .padding([.top,.bottom])
            }
            
        }
        .navigationViewStyle(.automatic)
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView(categories: Category.allCases, searchQuery: "")
            .previewLayout(.device)
            .previewDevice("iPhone 14 Pro")
        
    }
}
