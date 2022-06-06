//
//  StartView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 24/04/22.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .frame(width: 1200)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("KnowIDN")
                        .font(Font.system(size:150, design: .default))
                        .fontWeight(.bold)
                    Text("An Indonesian Cultural Pop Quiz and Encyclopedia")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.bottom,30)
                    HStack {
                        NavigationLink(destination: MainMenuView()) {
                            Text(" Press To Start " )
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundStyle(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4)
                                )
                            .padding()
                        }
                    }
                }
                .padding()
                .foregroundColor(Color.black.opacity(0.8))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
