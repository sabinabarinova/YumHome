//
//  CategoryCard.swift
//  Rec
//
//  Created by Adil Meirambek on 27.05.2023.
//

import SwiftUI

struct CategoryCard: View {
    var category: Category

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .overlay {
                    category.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 144, height: 144)
                        
                }
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom)
                        ).opacity(0.8)
                    
                }
                .overlay(alignment: .bottom) {
                    Text(category.rawValue)
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .frame(width: 80, height: 20)
                        .truncationMode(.tail)
                        .padding()
                    
                }
            

        }
        .frame(width: 160, height: 160)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 5)
        
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category.vegan)
    }
}
