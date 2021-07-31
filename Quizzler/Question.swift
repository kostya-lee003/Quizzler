//
//  Question.swift
//  Quizzler
//
//  Created by Kostya Lee on 24/07/21.
//

import Foundation

struct Question {
    let q: String
    let a: String
    
//    init(question: String?, answer: String?) {
//        self.q = question
//        self.a = answer
//    }
    }

extension Question {
    init(question: String, answer: String) {
        self.q = question
        self.a = answer
    }
}
