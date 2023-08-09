//
//  TabBar.swift
//  Rec
//
//

import SwiftUI

struct TabBar: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItem: [String] = [
        "house",
        "square.fill.text.grid.1x2",
        "plus.square",
        "heart",
        "person"
    ]
    
    var body: some View {
        
        ZStack {
            Capsule()
                .frame(width: 360, height:80)
            HStack (spacing: 36) {
                ForEach(0..<5) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack {
                            VStack(spacing: 12) {
                                Spacer()
                                
                                Image(systemName: tabBarItem[index])
                                    .font(.system(size: 24))
                                
                                
                                
                                if index + 1 == tabSelection {
                                    Circle()
                                        .frame(height: 4)
                                        .foregroundColor(CustomColor.yellow)
                                        .matchedGeometryEffect(id: "Selected", in: animationNamespace)
                                        .offset(y: -4)
                                } else {
                                    Circle()
                                        .frame(height: 4)
                                        .foregroundColor(.clear)
                                        .offset(y: -4)
                                }
                            
                            }
                            .foregroundColor(index + 1 == tabSelection ? CustomColor.yellow : .gray)
                        }
                        
                    }
                }
                .frame(height: 60)
                .clipShape(Capsule())
            }
            .padding(.horizontal)

  
            
        }
    }
    
    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar(tabSelection: .constant(1))
                .previewLayout(.sizeThatFits)
                .environmentObject(RecipeViewModel())
//                .padding(.vertical)
        }
    }
}
