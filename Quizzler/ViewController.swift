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
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    var i = 0
    
    var quizBrain = QuizBrain()
    var score = Score()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        Question.text = quizBrain.getQuestion(i)
        
    }
    
    private func updateUI() {
        setBtnProperties(TrueBtn)
        setBtnProperties(FalseBtn)
        AppearingLabel.alpha = 0
        AppearingLabel.layer.cornerRadius = 4.0
        AppearingLabel.layer.masksToBounds = true
        Question.textColor = .white
        ScoreLabel.textColor = .white

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
        progress(Float(i))
        ScoreLabel.text = "\(score.getScore()) / \(score.getNumOfQuestions())"
    }
    
    private func nextQuestion() {
        if i < quizBrain.quiz.count - 1 {
            i += 1
            Question.text = quizBrain.getQuestion(i)    // Setting the question runtime on device.
        } else {
            progress(Float(i))
            i += 1
            
        }
    }
    
    private func labelAppear() {
        setCorrectAnswerForLabel()
        labelDissapear(AppearingLabel)
    }
    
    private func labelDissapear(_ label: UILabel?) {
        label!.alpha = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            label!.alpha = 0
        }
    }
    
    private func setAppearingLabelColor(_ answer: Bool) {
        
        if answer == false {
            AppearingLabel.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        else if answer == true {
            AppearingLabel.backgroundColor = UIColor(red: 25/255, green: 205/255, blue: 25/255, alpha: 1.0)
        }
        
    }
    
    private func setCorrectAnswerForLabel() {
        
            if quizBrain.getAnswerForLabel() == true {
                AppearingLabel.text = "Correct!"
                setAppearingLabelColor(quizBrain.getAnswerForLabel()!)
                score.scoreUp()
            }
            else if quizBrain.getAnswerForLabel() == false {
                AppearingLabel.text = "Wrong!"
                setAppearingLabelColor(quizBrain.getAnswerForLabel()!)
            }
            
        }

    private func progress(_ i: Float) {
            print("\(i) / \(quizBrain.quiz.count)")
            Progress.progress = i / Float(quizBrain.quiz.count)
        }
    }
    


