//
//  SearchBarView.swift
//  Rec
//
//  Created by Adil Meirambek on 27.05.2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchQuery: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 24)
                .strokeBorder(Color.black.opacity(0.4), lineWidth: 1)
        }
        .frame(width: 348, height: 56)
        .overlay (alignment: .leading) {
            HStack  {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(
                        searchQuery.isEmpty ?
                            .gray : .black)
                TextField("Searching for ...",text: $searchQuery)
                    .foregroundColor(
                        searchQuery.isEmpty ?
                            .gray : .black)                            .font(.custom("Poppins-Regular", size: 20))
                    .disableAutocorrection(true)
                    .overlay (alignment: .trailing) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(
                                searchQuery.isEmpty ?
                                    .clear : .gray)
                            .padding(.trailing)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchQuery = ""
                            }
                    }
                    
            }
            .padding(.leading)
            
        }    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchQuery: .constant(""))
    }
}
