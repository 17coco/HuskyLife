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
        self.backgroundColor = .white
        
        themeLabel = UILabel()
        themeLabel.textAlignment = .center
        themeLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        //themeLabel.text = ""
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(themeLabel)
        
        timeLabel = UILabel()
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        timeLabel.text = "Elapsed Time:"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeLabel)
        
        timerLabel = UILabel()
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        timerLabel.text = "00:00:00"
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerLabel)
        
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
        
        pauseButton = UIButton(type:.system)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper1.addSubview(pauseButton)
        
        finishTimerButton = UIButton(type:.system)
        finishTimerButton.setTitle("Stop", for: .normal)
        finishTimerButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        finishTimerButton.setTitleColor(.white, for: .normal)
        finishTimerButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper2.addSubview(finishTimerButton)
        
        NSLayoutConstraint.activate([
            
            
            timerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -32),
            
            timeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: -32),
            
            themeLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -32),
            themeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonWrapper1.topAnchor.constraint(equalTo: self.timerLabel.bottomAnchor, constant: 64),
            buttonWrapper1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper1.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper1.widthAnchor.constraint(equalToConstant: 120),
            
            buttonWrapper2.topAnchor.constraint(equalTo: buttonWrapper1.bottomAnchor, constant: 32),
            buttonWrapper2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper2.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper2.widthAnchor.constraint(equalToConstant: 120),
            
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
