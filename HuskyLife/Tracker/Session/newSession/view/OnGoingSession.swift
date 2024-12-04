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
    var pauseButton:UIButton!
    var finishTimerButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        themeLabel = UILabel()
        themeLabel.textAlignment = .center
        themeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //themeLabel.text = ""
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(themeLabel)
        
        timerLabel = UILabel()
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        timerLabel.text = "Elapsed Time: 00:00:00"
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerLabel)
        
        pauseButton = UIButton(type:.system)
        pauseButton.setTitle("Stop", for: .normal)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pauseButton)
        
        finishTimerButton = UIButton(type:.system)
        finishTimerButton.setTitle("Stop", for: .normal)
        finishTimerButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(finishTimerButton)
        
        NSLayoutConstraint.activate([
            themeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            themeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            timerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -64),
            
            finishTimerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            finishTimerButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pauseButton.bottomAnchor.constraint(equalTo: finishTimerButton.topAnchor, constant: -16),
            pauseButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
