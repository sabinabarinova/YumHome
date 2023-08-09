//
//  OnboardingView.swift
//  Rec
//
//  Created by Adil Meirambek on 01.06.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var navigaTo = false
    var body: some View {
        NavigationView {
            Image("onboarding")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .overlay() {
                    VStack {
                        VStack(alignment: .trailing, spacing: -16) {
                            Text("YumHome")
                                .font(.custom("Damion", size: 60))
                            
                            Text("Inspire & Cook")
                                .font(.custom("Poppins Bold", size: 18))
                                .foregroundColor(CustomColor.green)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 24) {
                            NavigationLink(destination: LoginView(),isActive: $navigaTo ) {
                                Button {
                                    self.navigaTo = true
                                } label: {
                                    Text("GET STARTED")
                                        .font(.custom("Poppins-SemiBold", size: 20))
                                        .bold()
                                        .frame(width: 200, height: 40)
                                        .background(
                                            RoundedRectangle(cornerRadius: 32)
                                                .frame(width: 248, height: 64)
                                                .foregroundColor(.black)
                                        )
                                        .foregroundColor(.white)
                                }
                            }

                            
                            
                            Group {
                                Text("By creating your account, you accept our")
                                   

                                + Text(" Privacy Policy")
                                    .underline()
                                 

                                + Text (" and")
                                  

                                + Text (" Terms & Conditions")
                                    .underline()
                                   
                                    
                            }
                            .multilineTextAlignment(.center)
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.white)
                            


                        }
                        .frame(width: 250)
                    }
                    .frame(height: 700)
                }

        }
        .navigationBarHidden(true)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
