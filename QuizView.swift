//
//  QuizView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 24/04/22.
//

import SwiftUI

struct QuizView: View {
    
    //Get Quiz
    var quiz : QuizMaker = QuizMaker()
    
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
                    
                    QuestionText(text: quiz.questions)
                    
                    HStack {
                        NavigationLink(destination: QuizResultView(quiz: quiz, answer: quiz.optionList[0])) {
                            AnswerChoice(answer: quiz.optionList[0], letter: "A", color: Color.indigo.opacity(0.5))
                        }
                        NavigationLink(destination: QuizResultView(quiz: quiz, answer: quiz.optionList[1])) {
                            AnswerChoice(answer: quiz.optionList[1], letter: "B", color: Color.red.opacity(0.5))
                        }
                    }
                    HStack {
                        NavigationLink(destination: QuizResultView(quiz: quiz, answer: quiz.optionList[2])) {
                            AnswerChoice(answer: quiz.optionList[2], letter: "C", color: Color.orange.opacity(0.5))
                        }
                        NavigationLink(destination: QuizResultView(quiz: quiz, answer: quiz.optionList[0])) {
                            AnswerChoice(answer: quiz.optionList[3], letter: "D", color: Color.blue.opacity(0.5))
                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct QuestionText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(color: Color.indigo, radius: 2, x: 0, y: 3)
            .padding(.top,-30)
            .padding(.horizontal)
            .frame(width: 800, height: 130)
    }
}

struct AnswerChoice: View {
    var answer : String
    var letter : String
    var color : Color
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(color)
                    .frame(width:150)
                    .padding(.horizontal,60)
                
                Text(letter)
                    .foregroundColor(Color.white.opacity(0.5))
                    .fontWeight(.semibold)
                    .font(Font.system(size: 70, design: .default))
            }
            VStack(alignment: .leading) {
                Text(answer)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .foregroundColor(.black)
//                    .frame(height:150)
            }
            .padding(.top,-10)
            .padding(.bottom,25)
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50, style: .continuous))
        .padding()
        .frame(width:300,height: 350)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}




