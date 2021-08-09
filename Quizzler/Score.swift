//
//  Score.swift
//  Quizzler
//
//  Created by Kostya Lee on 02/08/21.
//

import Foundation
import  UIKit

class Score {
    
    static var score = 0
    private var numOfQuestions: Int = QuizBrain().quiz.count

    func getScore() -> Int {
        return Score.score
    }
    
    func getNumOfQuestions() -> Int {
        return numOfQuestions
    }
    
    func scoreUp() {
        Score.score += 1
    }
    
    func scoreZeroing() {
        Score.score = 0
    }
    
    
}
