//
//  CategoryFolderCard.swift
//  Rec
//
//  Created by Adil Meirambek on 28.05.2023.
//

import SwiftUI

struct CategoryFolderCard: View {
    var category: Category

    var body: some View {
        ZStack {
            HStack(alignment:.top) {
                HStack{
                    category.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                      
                    Text(category.rawValue)
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .padding()
                }
                Spacer()
                
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(.black)
                    
                    }
                }
                .padding(.top, 8)
            }
            .frame(width:300)
            
            .padding()
            
            
                

        }
        .frame(width: 348, height: 120)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 5)
    }
}

struct CategoryFolderCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFolderCard(category: Category.vegan)
    }
}
