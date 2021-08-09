//
//  Popup.swift
//  Quizzler
//
//  Created by Kostya Lee on 05/08/21.
//

import UIKit

class Popup: UIView {

    fileprivate let titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.text = "Your score"
        label.textAlignment = .center
        
        return label
    }()
    
    fileprivate let scoreLabel: UILabel = {
        var score = Score.score
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 44)
        print(score)
        let scorePercentage = "\(score * (100 / QuizBrain.init().quiz.count))%"
        print(score)
        label.text = scorePercentage
        
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    func setScore(_ score: Int) {
        Score.score = score
    }
    
    fileprivate let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .secondaryLabel
        v.layer.cornerRadius = 24
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 0.4
        return v
    }()
    
    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, scoreLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    @objc fileprivate func animateOut() {
        
        ViewController.init().iZeroing()
        Score.score = 0
        

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        }) 
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        
        self.alpha = 0
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier:  0.7).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:  0.3).isActive = true
        
        container.addSubview(stack)
        //stack.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        //stack.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
        stack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        animateIn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
