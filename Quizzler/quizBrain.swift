//
//  quizBrain.swift
//  Quizzler
//
//  Created by Kostya Lee on 25/07/21.
//

import Foundation
    
    struct QuizBrain {
        
        private var answerForLabel: Bool? = nil
        
       let quiz = [
        
           Question(q: "A slug's blood is green.", a: "True"),
           Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
           Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
           Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "False"),
           Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
           Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                   Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
           Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                   Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                   Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                   Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True"),
                   Question(q: "Marrakesh is the capital of Morocco", a: "False"),
                   Question(q: "Idina Menzel sings 'let it go' 20 times in 'Let It Go' from Frozen", a: "False"),
                   Question(q: "Waterloo has the greatest number of tube platforms in London", a: "True"),
                   Question(q: "M&M stands for Mars and Moordale", a: "False"),
                   Question(q: "Gin is typically included in a Long Island Iced Tea", a: "True"),
                   Question(q: "The unicorn is the national animal of Scotland", a: "True"),
                   Question(q: "There are two parts of the body that can't heal themselves", a: "False"),
                   Question(q: "Howard Donald is the oldest member of Take That", a: "True"),
                   Question(q: "The Great Wall of China is longer than the distance between London and Beijing", a: "True"),
                   Question(q: "There are 219 episodes of Friends", a: "False"),
                   Question(q: "'A' is the most common letter used in the English language", a: "False"),
                   Question(q: "A lion's roar can be heard up to eight kilometres away", a: "True"),
                   Question(q: "In Harry Potter, Draco Malfoy has no siblings", a: "False"),
                   Question(q: "Louis Walsh is older than Simon Cowell", a: "True"),
                   Question(q: "Monaco is the smallest country in the world", a: "False"),
                   Question(q: "Cinderella was the first Disney princess", a: "False"),
                   Question(q: "H&M stands for Hennes & Mauritz", a: "True"),
                   Question(q: "Ariana Grande is 25 or under", a: "False")
           
       ]
        
        func getQuestion(_ qNum: Int) -> String {

            return quiz[qNum].q
        }
        
        func getQuestionAnswer(_ aNum: Int) -> String {
            return quiz[aNum].a
        }
        
        mutating func checkAnswer(_ ans: String,_ userAns: String) {
            if ans == userAns {
                answerForLabel = true
            } else if userAns != ans {
                answerForLabel = false
            }
        }
        
        func getAnswerForLabel() -> Bool? {
            return answerForLabel
        }
        
        
        
}

