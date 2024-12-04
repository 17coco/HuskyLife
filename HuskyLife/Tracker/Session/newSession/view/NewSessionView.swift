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
    var enterTimeButton:UIButton!
    var liveTrackButton:UIButton!
    
    func setupLabels(){
        hintLabel1 = UILabel()
        hintLabel1.text = "To start a new session"
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Enter the theme of session below"
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel2)
        
        hintLabel3 = UILabel()
        hintLabel3.text = "And choose a way to record session"
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
        enterTimeButton = UIButton(type:.system)
        enterTimeButton.setTitle("Enter Time", for: .normal)
        enterTimeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(enterTimeButton)
        
        liveTrackButton = UIButton(type:.system)
        liveTrackButton.setTitle("Track a Session", for: .normal)
        liveTrackButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(liveTrackButton)
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
            
            themeTextField.topAnchor.constraint(equalTo: self.hintLabel3.bottomAnchor, constant: 16),
            themeTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            themeTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            
            enterTimeButton.topAnchor.constraint(equalTo: self.themeTextField.bottomAnchor, constant: 8),
            enterTimeButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 96),
            liveTrackButton.topAnchor.constraint(equalTo: enterTimeButton.topAnchor),
            liveTrackButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -96),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
