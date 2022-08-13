//
//  QuizModel.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/12.
//

import Foundation


struct DataModel: Codable {
    var data: QuizModel
}



struct QuizModel: Codable {
    var questions: [Questions]
}


struct Questions: Codable {
    
    var correct_answer: String
    var option_1: String
    var option_2: String
    var option_3: String
    var option_4: String
    var question: String
}
