//
//  NewSessionView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/2.
//

import UIKit

class NewSessionView: UIView {

    var hintLabel1:UILabel!
    var hintLabel2:UILabel!
    var hintLabel3:UILabel!
    var themeTextField:UITextField!
    var buttonWrapper1:UIView!
    var buttonWrapper2:UIView!
    var enterTimeButton:UIButton!
    var liveTrackButton:UIButton!
    
    func setupLabels(){
        hintLabel1 = UILabel()
        hintLabel1.text = "To start a new session"
        hintLabel1.textAlignment = .left
        hintLabel1.font = .systemFont(ofSize: 18)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Enter the theme of session below"
        hintLabel2.textAlignment = .left
        hintLabel2.font = .systemFont(ofSize: 18)
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel2)
        
        hintLabel3 = UILabel()
        hintLabel3.text = "And choose a way to record session"
        hintLabel3.textAlignment = .left
        hintLabel3.font = .systemFont(ofSize: 18)
        hintLabel3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel3)
    }
    
    func setupTextField() {
        themeTextField = UITextField()
        themeTextField.placeholder = "Theme of Session"
        themeTextField.borderStyle = .roundedRect
        themeTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(themeTextField)
    }
    
    func setupButtons() {
        buttonWrapper1 = UIView()
        buttonWrapper1.backgroundColor = .black
        buttonWrapper1.layer.cornerRadius = 4
        buttonWrapper1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper1)
        
        buttonWrapper2 = UIView()
        buttonWrapper2.backgroundColor = .black
        buttonWrapper2.layer.cornerRadius = 4
        buttonWrapper2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper2)
        
        enterTimeButton = UIButton(type:.system)
        enterTimeButton.setTitle("Enter Time", for: .normal)
        enterTimeButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        enterTimeButton.setTitleColor(.white, for: .normal)
        enterTimeButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper1.addSubview(enterTimeButton)
        
        liveTrackButton = UIButton(type:.system)
        liveTrackButton.setTitle("Track Session", for: .normal)
        liveTrackButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        liveTrackButton.setTitleColor(.white, for: .normal)
        liveTrackButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper2.addSubview(liveTrackButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupLabels()
        setupButtons()
        setupTextField()

        
        
        
        NSLayoutConstraint.activate([
            
            hintLabel1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            hintLabel1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            hintLabel2.topAnchor.constraint(equalTo: self.hintLabel1.bottomAnchor, constant: 8),
            hintLabel2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            hintLabel3.topAnchor.constraint(equalTo: self.hintLabel2.bottomAnchor, constant: 8),
            hintLabel3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            hintLabel3.topAnchor.constraint(equalTo: self.hintLabel2.bottomAnchor, constant: 8),
            hintLabel3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            themeTextField.topAnchor.constraint(equalTo: self.hintLabel3.bottomAnchor, constant: 32),
            themeTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            themeTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            
            buttonWrapper1.topAnchor.constraint(equalTo: self.themeTextField.bottomAnchor, constant: 32),
            buttonWrapper1.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper1.widthAnchor.constraint(equalToConstant: 150),
            buttonWrapper1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonWrapper2.topAnchor.constraint(equalTo: buttonWrapper1.bottomAnchor, constant: 16),
            buttonWrapper2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper2.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper2.widthAnchor.constraint(equalToConstant: 150),
            
            enterTimeButton.centerXAnchor.constraint(equalTo: buttonWrapper1.centerXAnchor),
            enterTimeButton.centerYAnchor.constraint(equalTo: buttonWrapper1.centerYAnchor),
            
            liveTrackButton.centerXAnchor.constraint(equalTo: buttonWrapper2.centerXAnchor),
            liveTrackButton.centerYAnchor.constraint(equalTo: buttonWrapper2.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
