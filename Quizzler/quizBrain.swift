//
//  quizBrain.swift
//  Quizzler
//
//  Created by Kostya Lee on 25/07/21.
//

import Foundation
    
    struct QuizBrain {
        
        private var correctAnswerForLabel: Bool? = nil
        
       let quiz = [
        
           Question(q: "A slug's blood is green.", a: "True"),
           Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
           Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
           Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "False"),
           Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
          ]
        
        func getQuestion(_ qNum: Int) -> String {

            return quiz[qNum].q
        }
        
        func getQuestionAnswer(_ aNum: Int) -> String {
            return quiz[aNum].a
        }
        
        mutating func checkAnswer(_ ans: String,_ userAns: String) {
            if ans == userAns {
                correctAnswerForLabel = true
            } else if userAns != ans {
                correctAnswerForLabel = false
            }
        }
        
        func getAnswerForLabel() -> Bool? {
            return correctAnswerForLabel
        }
        
        
        
}

