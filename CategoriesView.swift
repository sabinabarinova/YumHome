

import SwiftUI

struct CategoriesView: View {

    var categories: Category.AllCases
    @State var searchQuery = ""

    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            
            VStack {

                SearchBarView(searchQuery: $searchQuery)
                

                ScrollView {
                    
                    

                    LazyVGrid(columns: columns, spacing: 16){
                        ForEach(categories.filter({"\($0)".contains(searchQuery.lowercased()) || searchQuery.isEmpty})) { category in
                            NavigationLink(destination: CategoryView(category: category)) {
                                CategoryCard(category: category)
                            }
                            .padding(.top)

                            
                        }
                        
                    }

                    .padding(.horizontal)


                }
                .navigationBarTitle("Categories")

                .padding([.top, .bottom])
            }
            
        }


//        .padding(.vertical)

        .navigationViewStyle(.columns)

    }
    

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: Category.allCases, searchQuery: "")

    }
}
