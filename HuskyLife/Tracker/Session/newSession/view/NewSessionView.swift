//
//  NewSessionView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/2.
//

import UIKit

class NewSessionView: UIView {
    
    var hintLabel1: UILabel!
    var hintLabel2: UILabel!
    var hintLabel3: UILabel!
    var themeTextField: UITextField!
    var buttonWrapper1: UIView!
    var buttonWrapper2: UIView!
    var enterTimeButton: UIButton!
    var liveTrackButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 252/255, alpha: 1.0)
        setupLabels()
        setupButtons()
        setupTextField()
        
        NSLayoutConstraint.activate([
            hintLabel1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            hintLabel1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            hintLabel1.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            hintLabel2.topAnchor.constraint(equalTo: hintLabel1.bottomAnchor, constant: 8),
            hintLabel2.leadingAnchor.constraint(equalTo: hintLabel1.leadingAnchor),
            hintLabel2.trailingAnchor.constraint(equalTo: hintLabel1.trailingAnchor),
            
            hintLabel3.topAnchor.constraint(equalTo: hintLabel2.bottomAnchor, constant: 8),
            hintLabel3.leadingAnchor.constraint(equalTo: hintLabel1.leadingAnchor),
            hintLabel3.trailingAnchor.constraint(equalTo: hintLabel1.trailingAnchor),
            
            themeTextField.topAnchor.constraint(equalTo: hintLabel3.bottomAnchor, constant: 32),
            themeTextField.leadingAnchor.constraint(equalTo: hintLabel1.leadingAnchor),
            themeTextField.trailingAnchor.constraint(equalTo: hintLabel1.trailingAnchor),
            themeTextField.heightAnchor.constraint(equalToConstant: 50),
            
            buttonWrapper1.topAnchor.constraint(equalTo: themeTextField.bottomAnchor, constant: 32),
            buttonWrapper1.heightAnchor.constraint(equalToConstant: 50),
            buttonWrapper1.leadingAnchor.constraint(equalTo: themeTextField.leadingAnchor),
            buttonWrapper1.trailingAnchor.constraint(equalTo: themeTextField.trailingAnchor),
            
            buttonWrapper2.topAnchor.constraint(equalTo: buttonWrapper1.bottomAnchor, constant: 16),
            buttonWrapper2.leadingAnchor.constraint(equalTo: themeTextField.leadingAnchor),
            buttonWrapper2.trailingAnchor.constraint(equalTo: themeTextField.trailingAnchor),
            buttonWrapper2.heightAnchor.constraint(equalToConstant: 50),
            
            enterTimeButton.centerXAnchor.constraint(equalTo: buttonWrapper1.centerXAnchor),
            enterTimeButton.centerYAnchor.constraint(equalTo: buttonWrapper1.centerYAnchor),
            
            liveTrackButton.centerXAnchor.constraint(equalTo: buttonWrapper2.centerXAnchor),
            liveTrackButton.centerYAnchor.constraint(equalTo: buttonWrapper2.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLabels() {
        hintLabel1 = UILabel()
        hintLabel1.text = "To start a new session"
        hintLabel1.textAlignment = .left
        hintLabel1.font = .systemFont(ofSize: 24, weight: .bold)
        hintLabel1.textColor = UIColor(red: 30/255, green: 41/255, blue: 59/255, alpha: 1.0)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Enter the theme of session below"
        hintLabel2.textAlignment = .left
        hintLabel2.font = .systemFont(ofSize: 18, weight: .medium)
        hintLabel2.textColor = UIColor(red: 71/255, green: 85/255, blue: 105/255, alpha: 1.0)
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hintLabel2)
        
        hintLabel3 = UILabel()
        hintLabel3.text = "And choose a way to record session"
        hintLabel3.textAlignment = .left
        hintLabel3.font = .systemFont(ofSize: 18, weight: .medium)
        hintLabel3.textColor = UIColor(red: 71/255, green: 85/255, blue: 105/255, alpha: 1.0)
        hintLabel3.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hintLabel3)
    }
    
    func setupTextField() {
        themeTextField = UITextField()
        themeTextField.placeholder = "Theme of Session"
        themeTextField.font = .systemFont(ofSize: 18)
        themeTextField.borderStyle = .none
        themeTextField.backgroundColor = .white
        themeTextField.layer.cornerRadius = 8
        themeTextField.layer.borderWidth = 0.5
        themeTextField.layer.borderColor = UIColor(red: 203/255, green: 213/255, blue: 225/255, alpha: 1.0).cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: themeTextField.frame.height))
        themeTextField.leftView = paddingView
        themeTextField.leftViewMode = .always
        themeTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(themeTextField)
    }
    
    func setupButtons() {
        buttonWrapper1 = UIView()
        buttonWrapper1.backgroundColor = .black
        buttonWrapper1.layer.cornerRadius = 8
        buttonWrapper1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonWrapper1)
        
        buttonWrapper2 = UIView()
        buttonWrapper2.backgroundColor = .black
        buttonWrapper2.layer.cornerRadius = 8
        buttonWrapper2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonWrapper2)
        
        enterTimeButton = UIButton(type: .system)
        enterTimeButton.setTitle("Enter Time", for: .normal)
        enterTimeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        enterTimeButton.setTitleColor(.white, for: .normal)
        enterTimeButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper1.addSubview(enterTimeButton)
        
        liveTrackButton = UIButton(type: .system)
        liveTrackButton.setTitle("Track Session", for: .normal)
        liveTrackButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        liveTrackButton.setTitleColor(.white, for: .normal)
        liveTrackButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper2.addSubview(liveTrackButton)
    }
}
