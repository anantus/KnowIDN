//
//  QuizResultView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 25/04/22.
//

import SwiftUI

struct QuizResultView: View {
    
    var quiz : QuizMaker
    var answer : String
    
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
                    Text("Cultural Pop Quiz!")
                        .font(Font.system(size:80, design: .default))
                        .fontWeight(.bold)
                        .shadow(color: Color.blue, radius: 2, x: 0, y: 3)
                        .padding()
                    //temp
                    if answer != quiz.answerString{
                        ZStack{
                            Circle()
                                .fill(LinearGradient(colors:[.red.opacity(1), .red.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                                .frame(width:100,height: 100)
                                
//                            Image(systemName: "x.circle.fill")
//                                .resizable()
//                                .frame(width: 250, height: 250)
//                                .foregroundColor(Color.white.opacity(0.5))
                            Text("X")
                                .font(Font.system(size:50, design: .default))
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        Text("INCORRECT!")
                            .font(Font.system(size:50, design: .default))
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(colors:[.red.opacity(0.8), .red.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                            .shadow(color: Color.red, radius: 2, x: 0, y: 3)
                    }else{
                        ZStack{
                            Circle()
                                .fill(LinearGradient(colors:[.green.opacity(1), .green.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                                .frame(width: 100, height: 100)
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        Text("CORRECT!")
                            .font(Font.system(size:50, design: .default))
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                            .shadow(color: Color.green, radius: 2, x: 0, y: 3)
                    }
                    
                    
                    Text("\(quiz.answerCulture.entity) is a \(quiz.answerCulture.kategori) from \(quiz.answerCulture.provinsi)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(color: Color.indigo, radius: 2, x: 0, y: 3)
                        .frame(width: 700, height: 150)
                        .padding(.horizontal)
                    
                    VStack(spacing: 20){
                        NavigationLink(destination: QuizView()) {
                            Text(" Play Again " )
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundStyle(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:600, height: 60)
                                .padding()
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
                        }
                        NavigationLink(destination: CultureView(filterSearch: quiz.answerCulture.kategori, searchOn: "Categories")) {
                            Text(" Find More From \(quiz.answerCulture.kategori) Category " )
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundStyle(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:600, height: 60)
                                .padding()
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
                        }
                        
                        NavigationLink(destination: CultureView(filterSearch: quiz.answerCulture.provinsi, searchOn: "Provinces")) {
                            Text(" Find More From \(quiz.answerCulture.provinsi) " )
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundStyle(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:600, height: 60)
                                .padding()
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
                        }
                        
                        NavigationLink(destination: MainMenuView()) {
                            Text(" Back to Menu " )
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundStyle(LinearGradient(colors:[.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:600, height: 60)
                                .padding()
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
                        }
                    }
                    .padding()
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct QuizResultView_Previews: PreviewProvider {
    
    static var quiz = QuizMaker()
    
    static var previews: some View {
        QuizResultView(quiz: quiz, answer: quiz.answerString)
    }
}
