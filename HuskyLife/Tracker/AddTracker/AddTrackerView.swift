//
//  AddTrackerView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class AddTrackerView: UIView {
    var nameTextField:UITextField!
    var timeNeededTextField:UITextField!
    var initGoalTextField:UITextField!
    var addButton:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = .white
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Task Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
        
        timeNeededTextField = UITextField()
        timeNeededTextField.placeholder = "Time Needed"
        timeNeededTextField.borderStyle = .roundedRect
        timeNeededTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeNeededTextField)
        
        
        initGoalTextField = UITextField()
        initGoalTextField.placeholder = "Enter your first goal here."
        initGoalTextField.borderStyle = .roundedRect
        initGoalTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(initGoalTextField)
        
        addButton = UIButton(type: .system)
        addButton.setTitle("Add Tracker", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
        
        //MARK: constraints...
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            timeNeededTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            timeNeededTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            timeNeededTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            initGoalTextField.topAnchor.constraint(equalTo: timeNeededTextField.bottomAnchor, constant: 20),
            initGoalTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            initGoalTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            addButton.topAnchor.constraint(equalTo: initGoalTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
