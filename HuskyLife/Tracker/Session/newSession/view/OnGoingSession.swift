//
//  OnGoingSession.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/2.
//

import UIKit

class OnGoingSession: UIView {

    var themeLabel:UILabel!
    var timerLabel:UILabel!
    var timeLabel:UILabel!
    var pauseButton:UIButton!
    var finishTimerButton:UIButton!
    var buttonWrapper1:UIView!
    var buttonWrapper2:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 252/255, alpha: 1.0) // Light gray background
        
        themeLabel = UILabel()
        themeLabel.textAlignment = .center
        themeLabel.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        themeLabel.textColor = UIColor(red: 30/255, green: 41/255, blue: 59/255, alpha: 1.0)
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(themeLabel)
        
        timeLabel = UILabel()
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        timeLabel.text = "Elapsed Time"
        timeLabel.textColor = UIColor(red: 71/255, green: 85/255, blue: 105/255, alpha: 1.0)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeLabel)
        
        timerLabel = UILabel()
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        timerLabel.text = "00:00:00"
        timerLabel.textColor = UIColor(red: 37/255, green: 99/255, blue: 235/255, alpha: 1.0)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerLabel)
        
        buttonWrapper1 = UIView()
        buttonWrapper1.backgroundColor = UIColor(red: 37/255, green: 99/255, blue: 235/255, alpha: 1.0)
        buttonWrapper1.layer.cornerRadius = 25
        buttonWrapper1.layer.shadowColor = UIColor.black.cgColor
        buttonWrapper1.layer.shadowOffset = CGSize(width: 0, height: 4)
        buttonWrapper1.layer.shadowRadius = 8
        buttonWrapper1.layer.shadowOpacity = 0.1
        buttonWrapper1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper1)
        
        buttonWrapper2 = UIView()
        buttonWrapper2.backgroundColor = UIColor(red: 239/255, green: 68/255, blue: 68/255, alpha: 1.0)
        buttonWrapper2.layer.cornerRadius = 25
        buttonWrapper2.layer.shadowColor = UIColor.black.cgColor
        buttonWrapper2.layer.shadowOffset = CGSize(width: 0, height: 4)
        buttonWrapper2.layer.shadowRadius = 8
        buttonWrapper2.layer.shadowOpacity = 0.1
        buttonWrapper2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper2)
        
        pauseButton = UIButton(type:.system)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper1.addSubview(pauseButton)
        
        finishTimerButton = UIButton(type:.system)
        finishTimerButton.setTitle("Stop", for: .normal)
        finishTimerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        finishTimerButton.setTitleColor(.white, for: .normal)
        finishTimerButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper2.addSubview(finishTimerButton)
        
        NSLayoutConstraint.activate([
            themeLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -48),
            themeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            themeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            themeLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            timeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -80),
            timerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 16),
            
            buttonWrapper1.topAnchor.constraint(equalTo: self.timerLabel.bottomAnchor, constant: 64),
            buttonWrapper1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper1.heightAnchor.constraint(equalToConstant: 50),
            buttonWrapper1.widthAnchor.constraint(equalToConstant: 160),
            
            buttonWrapper2.topAnchor.constraint(equalTo: buttonWrapper1.bottomAnchor, constant: 24),
            buttonWrapper2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper2.heightAnchor.constraint(equalToConstant: 50),
            buttonWrapper2.widthAnchor.constraint(equalToConstant: 160),
            
            finishTimerButton.centerYAnchor.constraint(equalTo: buttonWrapper2.centerYAnchor),
            finishTimerButton.centerXAnchor.constraint(equalTo: self.buttonWrapper2.centerXAnchor),
            
            pauseButton.centerYAnchor.constraint(equalTo: buttonWrapper1.centerYAnchor),
            pauseButton.centerXAnchor.constraint(equalTo: self.buttonWrapper1.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
