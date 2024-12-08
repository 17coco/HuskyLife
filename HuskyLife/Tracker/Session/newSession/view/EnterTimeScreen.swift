//
//  EnterTimeScreen.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//

import UIKit

class EnterTimeScreen: UIView {

    var hintLabel1:UILabel!
    var hintLabel2:UILabel!
    var datePickerStart:UIDatePicker!
    var datePickerEnd:UIDatePicker!
    var timeProceedButton:UIButton!
    var buttonWrapper:UIView!
    
    func setupLabels(){
        hintLabel1 = UILabel()
        hintLabel1.text = "Enter Start Time"
        hintLabel1.font = .boldSystemFont(ofSize: 18)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Enter End Time"
        hintLabel2.font = .boldSystemFont(ofSize: 18)
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hintLabel2)
        
    }
    
    func setupDatePickers() {
        datePickerStart = UIDatePicker()
        datePickerStart.datePickerMode = .dateAndTime // You can change to `.date`, `.time`, or `.countDownTimer`
        datePickerStart.preferredDatePickerStyle = .wheels // Can be `.compact` or `.inline` based on your needs
        datePickerStart.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerStart)
        
        datePickerEnd = UIDatePicker()
        datePickerEnd.datePickerMode = .dateAndTime // You can change to `.date`, `.time`, or `.countDownTimer`
        datePickerEnd.preferredDatePickerStyle = .wheels // Can be `.compact` or `.inline` based on your needs
        datePickerEnd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerEnd)
    }
    
    func setupButtons() {
        buttonWrapper = UIView()
        buttonWrapper.backgroundColor = .black
        buttonWrapper.layer.cornerRadius = 4
        buttonWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWrapper)
        
        timeProceedButton = UIButton(type:.system)
        timeProceedButton.setTitle("Proceed", for: .normal)
        timeProceedButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        timeProceedButton.setTitleColor(.white, for: .normal)
        timeProceedButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper.addSubview(timeProceedButton)
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupLabels()
        setupButtons()
        setupDatePickers()

        
        
        
        NSLayoutConstraint.activate([
            
            hintLabel1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            hintLabel1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            datePickerStart.topAnchor.constraint(equalTo: self.hintLabel1.bottomAnchor, constant: 8),
            datePickerStart.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            hintLabel2.topAnchor.constraint(equalTo: self.datePickerStart.bottomAnchor, constant: 8),
            hintLabel2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            datePickerEnd.topAnchor.constraint(equalTo: self.hintLabel2.bottomAnchor, constant: 8),
            datePickerEnd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonWrapper.topAnchor.constraint(equalTo: self.datePickerEnd.bottomAnchor, constant: 32),
            buttonWrapper.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonWrapper.heightAnchor.constraint(equalToConstant: 32),
            buttonWrapper.widthAnchor.constraint(equalToConstant: 150),
            
            timeProceedButton.centerYAnchor.constraint(equalTo: buttonWrapper.centerYAnchor),
            timeProceedButton.centerXAnchor.constraint(equalTo: buttonWrapper.centerXAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
