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
    @IBOutlet weak var AppearingLabel: UILabel!
    
    
    var i = 0
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        Question.text = quizBrain.getQuestion(i)
        
    }
    
    private func setAppearingLabelColor(_ answer: Bool) {
        if answer == false {
            AppearingLabel.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        else if answer == true {
            AppearingLabel.backgroundColor = UIColor(red: 25/255, green: 205/255, blue: 25/255, alpha: 1.0)
        }
        
    }
    
    private func updateUI() {
        setBtnProperties(TrueBtn)
        setBtnProperties(FalseBtn)
        updateAppearingLabel()
    }
    
    private func updateAppearingLabel() {
        AppearingLabel.backgroundColor = UIColor(red: 25/255, green: 205/255, blue: 25/255, alpha: 0)
        AppearingLabel.textColor = UIColor( white: 0, alpha: 0)
    }
    
    private func setBtnProperties(_ button: UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = button.frame.width / 15
    }

    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        AppearingLabel.textColor = UIColor( white: 0, alpha: 1.0)
        
        quizBrain.checkAnswer(quizBrain.getQuestionAnswer(i), sender.currentTitle!)
        
        labelAppear()
        nextQuestion()
        progress()
        
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
    
    func labelAppear() {
        
        setCorrectAnswerForLabel()
    }
    
    func setCorrectAnswerForLabel() {
        
        if quizBrain.getAnswerForLabel() == true {
            AppearingLabel.text = "Correct!"
            setAppearingLabelColor(quizBrain.getAnswerForLabel()!)
        }
        else if quizBrain.getAnswerForLabel() == false {
            AppearingLabel.text = "Wrong!"
            setAppearingLabelColor(quizBrain.getAnswerForLabel()!)
        }
            
        }
    
    private func progress() {
        Progress.progress = Float(i) / Float(quizBrain.quiz.count)
    }
    }
    

