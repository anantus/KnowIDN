//
//  QuizFactory.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 24/04/22.
//

import Foundation
import SwiftUI

struct QuizMaker{
    var questions: String = ""
    var questionType: Int
    var searchOn: String = ""
    var randRow: Int
    var optionList: [String] = []
    var answerCulture: Culture 
    var answerString: String = ""
    
    init(){
        optionList = []
        questionType = Int.random(in: 0..<4)
        randRow = Int.random(in: 1..<4094)
        
        let cultures = loadCSV(from: "Indonesian_Culture")
        answerCulture = cultures[randRow]
        
        
        
        //Question about province given entity
        if questionType == 0 {
            searchOn = "Provinces"
            answerString = answerCulture.provinsi
            optionList.append(answerCulture.provinsi)
            questions = "What province did \(answerCulture.entity) comes from?"
            
            while(optionList.count != 4){
                randRow = Int.random(in: 1..<4094)
                let newCulture = cultures[randRow]
                if optionList.contains(newCulture.provinsi) == false{
                    optionList.append(newCulture.provinsi)
                }
                
            }
        }
        
        //Question about entity given province
        else if questionType == 1 {
            searchOn = "Provinces"
            answerString = answerCulture.entity
            optionList.append(answerCulture.entity)
            questions = "Which Indonesian Culture comes from \(answerCulture.provinsi)?"
            
            while(optionList.count != 4){
                randRow = Int.random(in: 1..<4094)
                let newCulture = cultures[randRow]
                if optionList.contains(newCulture.provinsi) == false{
                    optionList.append(newCulture.entity)
                }
                
            }
        }
        
        //Question about category given entity
        else if questionType == 2 {
            searchOn = "Categories"
            answerString = answerCulture.kategori
            optionList.append(answerCulture.kategori)
            questions = "What category is \(answerCulture.entity)?"
            
            while(optionList.count != 4){
                randRow = Int.random(in: 1..<4095)
                let newCulture = cultures[randRow]
                if optionList.contains(newCulture.kategori) == false{
                    optionList.append(newCulture.kategori)
                }
                
            }
        }
        
        //ask about entity given category
        else if questionType == 3 {
            searchOn = "Categories"
            answerString = answerCulture.entity
            optionList.append(answerCulture.entity)
            questions = "Which of the Indonesian Culture categorized as \(answerCulture.kategori)?"
            while(optionList.count != 4){
                randRow = Int.random(in: 1..<4095)
                let newCulture = cultures[randRow]
                
                if optionList.contains(newCulture.entity) == false{
                    optionList.append(newCulture.entity)
                }
                
            }
        }
        
        optionList.shuffle()
        
    }
    
    
    
    
}

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool
    var quizWinningStatus: Bool = false
}

struct QuizModel {
    var question: String
    var answer: String
    var optionsList: [Culture]
}
