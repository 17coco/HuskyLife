//
//  AddTrackerView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class AddTrackerView: UIView {
    var addLabel:UILabel!
    var nameTextField:UITextField!
    var timeNeededTextField:UITextField!
    var initGoalTextField:UITextField!
    var addButton:UIButton!
    var buttonWrapper:UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = .white
        
        addLabel = UILabel()
        addLabel.text = "Add Tracker"
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.font = .systemFont(ofSize: 20)
        self.addSubview(addLabel)
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Task Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
        
        timeNeededTextField = UITextField()
        timeNeededTextField.placeholder = "Time Needed (Hours)"
        timeNeededTextField.borderStyle = .roundedRect
        timeNeededTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeNeededTextField)
        
        
        initGoalTextField = UITextField()
        initGoalTextField.placeholder = "Enter your goal here"
        initGoalTextField.borderStyle = .roundedRect
        initGoalTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(initGoalTextField)
        
        buttonWrapper = UIView()
        buttonWrapper.backgroundColor = .black
        buttonWrapper.layer.cornerRadius = 4
        buttonWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper)
        
        addButton = UIButton(type: .system)
        addButton.setTitle("Finish", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        addButton.setTitleColor(.white, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper.addSubview(addButton)
        
        //MARK: constraints...
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            addLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: addLabel.bottomAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            timeNeededTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            timeNeededTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            timeNeededTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            initGoalTextField.topAnchor.constraint(equalTo: timeNeededTextField.bottomAnchor, constant: 20),
            initGoalTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            initGoalTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            buttonWrapper.topAnchor.constraint(equalTo: self.initGoalTextField.bottomAnchor, constant: 32),
            buttonWrapper.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper.widthAnchor.constraint(equalToConstant: 150),
            
            addButton.centerXAnchor.constraint(equalTo: buttonWrapper.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: buttonWrapper.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
