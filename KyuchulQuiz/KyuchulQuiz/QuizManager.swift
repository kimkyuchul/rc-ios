//
//  QuizManager.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/16.
//

import Foundation


struct QuizManager {
    var quizmodel : Questions?
    var score = 0
    
    
    mutating func checkAnswer(userAnswer : String) -> Bool {
        
        if userAnswer == quizmodel?.correct_answer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
