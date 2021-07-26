//
//  ViewController.swift
//  Quizzler
//
//  Created by Kostya Lee on 23/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var FalseBtn: UIButton!
    @IBOutlet weak var TrueBtn: UIButton!
    @IBOutlet weak var Progress: UIProgressView!
    @IBOutlet weak var Question: UILabel!
    
    
    var i = 0
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        Question.text = quizBrain.getQuestion(i)
        
    }
    
    private func updateUI() {
        setBtnProperties(TrueBtn)
        setBtnProperties(FalseBtn)
    }
    
    private func setBtnProperties(_ button: UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = button.frame.width / 15
    }

    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        quizBrain.checkAnswer(quizBrain.getQuestionAnswer(i), sender.currentTitle!)
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        if i == quizBrain.quiz.count - 1 {
            i = 0
            Question.text = quizBrain.getQuestion(i)
        } else {
            i += 1
            Question.text = quizBrain.getQuestion(i)    // Setting the question runtime on device.
        }
    }
    
}

