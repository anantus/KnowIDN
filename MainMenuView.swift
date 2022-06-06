//
//  MainMenuView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 24/04/22.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                Circle()
                    .foregroundColor(Color.orange.opacity(0.15))
                    .blur(radius: 20)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                        Text("KnowIDN")
                            .font(Font.system(size:150, design: .default))
                            .fontWeight(.bold)
                        Text("An Indonesian Cultural Pop Quiz and Encyclopedia")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding(.bottom,30)
                    
                    NavigationLink(destination: QuizView()) {
                        VStack{
                            Image("Quiz")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .padding()
                            VStack(alignment: .leading) {
                                Text("Cultural Pop Quiz")
                                    .fontWeight(.semibold)
                                    .font(.largeTitle)
                                Text("How well do you know about Indonesian Culture?")
                                    .font(.title)
                            }
                            .padding(.top,-10)
                            .padding(.bottom,15)
                        }
                        .foregroundColor(Color.black)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
                    .frame(width: 650, height: 380)
                    }
                    
                    VStack{
                        Text("Encyclopedia".uppercased())
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .padding(.bottom,-5)
                            .padding(.top)
                        HStack{
                            
                            NavigationLink(destination: CultureView(filterSearch: "", searchOn: "")) {
                                VStack{
                                    Image("All")
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 50))
                                        .padding()
                                    VStack(alignment: .leading) {
                                        Text("Cultures")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top,-10)
                                    .padding(.bottom,15)
                                }
                                .frame(height: 290)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
                            }.foregroundColor(Color.black)

                            NavigationLink(destination: SearchGroupView(searchOn: "Categories")) {
                                VStack{
                                    Image("Category")
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 50))
                                        .padding()
                                    VStack(alignment: .leading) {
                                        Text("Categories")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top,-10)
                                    .padding(.bottom,15)
                                }
                                .frame(height: 290)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
                            }.foregroundColor(Color.black)
                            
                            NavigationLink(destination: SearchGroupView(searchOn: "Provinces")) {
                                VStack{
                                    Image("Province")
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 50))
                                        .padding()
                                    VStack(alignment: .leading) {
                                        Text("Province")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top,-10)
                                    .padding(.bottom,15)
                                }
                                .frame(height: 290)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
                            }.foregroundColor(Color.black)
                        }
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
