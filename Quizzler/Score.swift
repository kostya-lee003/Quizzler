//
//  Score.swift
//  Quizzler
//
//  Created by Kostya Lee on 02/08/21.
//

import Foundation
import  UIKit

struct Score {
    private var score: Int = 0
    private var numOfQuestions: Int = QuizBrain().quiz.count
    
    func getScore() -> Int{
        return score
    }
    
    func getNumOfQuestions() -> Int {
        return numOfQuestions
    }
    
    mutating func scoreUp() {
        score += 1
    }
    
    
}
