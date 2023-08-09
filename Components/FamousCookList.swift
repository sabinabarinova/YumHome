//
//  FamousCookList.swift
//  Rec
//
//  Created by Adil Meirambek on 31.05.2023.
//

import SwiftUI

struct FamousCookList: View {
    var cooks: [FamousCook]
    var body: some View {
        VStack {
            LazyHStack {

                ForEach(cooks) { cook in
                    VStack (alignment: .center) {
                        FamousCookCard(famousCook: cook)
                        Text("\(cook.name)")
                            .multilineTextAlignment(.center)
                            .font(.custom("Poppins-SemiBold", size: 12))
                            .foregroundColor(.black)
                            .frame(width: 100, height: 20)
                        
                    }
                    
                    
                }

            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

struct FamousCookList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            FamousCookList(cooks: FamousCook.allCooks)
            
        }
    }
}
