//
//  EnterContentScreen.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//
import UIKit

class EnterContentScreen: UIView {
    var hintLabel1: UILabel!
    var hintLabel2: UILabel!
    var contentTextView: UITextView!
    var buttonWrapper: UIView!
    var contentFinishButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 252/255, alpha: 1.0)
        
        hintLabel1 = UILabel()
        hintLabel1.text = "Good Job! 🎉"
        hintLabel1.font = .systemFont(ofSize: 36, weight: .heavy)
        hintLabel1.textColor = UIColor(red: 30/255, green: 41/255, blue: 59/255, alpha: 1.0)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Record what you did:"
        hintLabel2.font = .systemFont(ofSize: 20, weight: .medium)
        hintLabel2.textColor = UIColor(red: 71/255, green: 85/255, blue: 105/255, alpha: 1.0)
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel2)
        
        contentTextView = UITextView()
        contentTextView.font = .systemFont(ofSize: 18)
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.borderColor = UIColor(red: 203/255, green: 213/255, blue: 225/255, alpha: 1.0).cgColor
        contentTextView.backgroundColor = .white
        contentTextView.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
        contentTextView.layer.shadowColor = UIColor.black.cgColor
        contentTextView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentTextView.layer.shadowRadius = 4
        contentTextView.layer.shadowOpacity = 0.05
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentTextView)
        
        buttonWrapper = UIView()
        buttonWrapper.backgroundColor = .black
        buttonWrapper.layer.cornerRadius = 8
        buttonWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper)
        
        contentFinishButton = UIButton(type: .system)
        contentFinishButton.setTitle("Finish", for: .normal)
        contentFinishButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        contentFinishButton.setTitleColor(.white, for: .normal)
        contentFinishButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper.addSubview(contentFinishButton)
        
        NSLayoutConstraint.activate([
            hintLabel1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            hintLabel1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            hintLabel2.topAnchor.constraint(equalTo: self.hintLabel1.bottomAnchor, constant: 16),
            hintLabel2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            contentTextView.topAnchor.constraint(equalTo: self.hintLabel2.bottomAnchor, constant: 24),
            contentTextView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            contentTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            contentTextView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.45),
            
            buttonWrapper.topAnchor.constraint(equalTo: self.contentTextView.bottomAnchor, constant: 32),
            buttonWrapper.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper.heightAnchor.constraint(equalToConstant: 50),
            buttonWrapper.leadingAnchor.constraint(equalTo: self.contentTextView.leadingAnchor),
            buttonWrapper.trailingAnchor.constraint(equalTo: self.contentTextView.trailingAnchor),
            
            contentFinishButton.centerYAnchor.constraint(equalTo: buttonWrapper.centerYAnchor),
            contentFinishButton.centerXAnchor.constraint(equalTo: buttonWrapper.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
