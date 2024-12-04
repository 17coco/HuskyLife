//
//  EnterContentScreen.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//

import UIKit

class EnterContentScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var hintLabel1:UILabel!
    var hintLabel2:UILabel!
    var contentTextView:UITextView!
    var contentFinishButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Record what you did for this session here:"
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel2)
        
        hintLabel1 = UILabel()
        hintLabel1.text = "Good Job!"
        hintLabel1.font = .boldSystemFont(ofSize: 32)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel1)
        
        contentTextView = UITextView()
        contentTextView.font = .systemFont(ofSize: 24)
        contentTextView.layer.cornerRadius = 5
        contentTextView.layer.borderWidth = 1
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentTextView)
        
        contentFinishButton = UIButton(type:.system)
        contentFinishButton.setTitle("FINISH", for: .normal)
        contentFinishButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentFinishButton)
        
        NSLayoutConstraint.activate([
            
            hintLabel1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            hintLabel1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            hintLabel2.topAnchor.constraint(equalTo: self.hintLabel1.bottomAnchor, constant: 8),
            hintLabel2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            contentTextView.topAnchor.constraint(equalTo: self.hintLabel2.bottomAnchor, constant: 8),
            contentTextView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            contentTextView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),

            
            contentFinishButton.topAnchor.constraint(equalTo: self.contentTextView.bottomAnchor, constant: 8),
            contentFinishButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 96),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
