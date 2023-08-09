//
//  FamousCookList.swift
//  Rec
//
//  Created by Adil Meirambek on 31.05.2023.
//

import SwiftUI

struct FamousCookCard: View {
    var famousCook: FamousCook

    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: famousCook.imageLink)){image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .overlay(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom)
                            ).opacity(0.8)
                    }
            } placeholder: {
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                    
                    
            }
            
           
            
        
        }
        
        .frame(width: 100, height: 100)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 5)    }
}

struct FamousCookCard_Previews: PreviewProvider {
    static var previews: some View {
        FamousCookCard(famousCook: FamousCook.allCooks[1])
    }
}
