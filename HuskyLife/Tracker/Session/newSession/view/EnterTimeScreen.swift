//
//  EnterTimeScreen.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//

import UIKit

class EnterTimeScreen: UIView {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var hintLabel1: UILabel!
    var hintLabel2: UILabel!
    var datePickerStart: UIDatePicker!
    var datePickerEnd: UIDatePicker!
    var timeProceedButton: UIButton!
    var buttonWrapper: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 252/255, alpha: 1.0)
        setupScrollView()
        setupLabels()
        setupDatePickers()
        setupButtons()
        setupConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }
    
    func setupLabels() {
        hintLabel1 = UILabel()
        hintLabel1.text = "Enter Start Time"
        hintLabel1.font = .systemFont(ofSize: 24, weight: .bold)
        hintLabel1.textColor = UIColor(red: 30/255, green: 41/255, blue: 59/255, alpha: 1.0)
        hintLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hintLabel1)
        
        hintLabel2 = UILabel()
        hintLabel2.text = "Enter End Time"
        hintLabel2.font = .systemFont(ofSize: 24, weight: .bold)
        hintLabel2.textColor = UIColor(red: 30/255, green: 41/255, blue: 59/255, alpha: 1.0)
        hintLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hintLabel2)
    }
    
    func setupDatePickers() {
        datePickerStart = UIDatePicker()
        datePickerStart.datePickerMode = .dateAndTime
        datePickerStart.preferredDatePickerStyle = .wheels
        datePickerStart.backgroundColor = .white
        datePickerStart.layer.cornerRadius = 8
        datePickerStart.layer.borderWidth = 0.5
        datePickerStart.layer.borderColor = UIColor(red: 203/255, green: 213/255, blue: 225/255, alpha: 1.0).cgColor
        datePickerStart.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePickerStart)
        
        datePickerEnd = UIDatePicker()
        datePickerEnd.datePickerMode = .dateAndTime
        datePickerEnd.preferredDatePickerStyle = .wheels
        datePickerEnd.backgroundColor = .white
        datePickerEnd.layer.cornerRadius = 8
        datePickerEnd.layer.borderWidth = 0.5
        datePickerEnd.layer.borderColor = UIColor(red: 203/255, green: 213/255, blue: 225/255, alpha: 1.0).cgColor
        datePickerEnd.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePickerEnd)
    }
    
    func setupButtons() {
        buttonWrapper = UIView()
        buttonWrapper.backgroundColor = .black
        buttonWrapper.layer.cornerRadius = 8
        buttonWrapper.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonWrapper)
        
        timeProceedButton = UIButton(type: .system)
        timeProceedButton.setTitle("Proceed", for: .normal)
        timeProceedButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        timeProceedButton.setTitleColor(.white, for: .normal)
        timeProceedButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper.addSubview(timeProceedButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hintLabel1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            hintLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            hintLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            datePickerStart.topAnchor.constraint(equalTo: hintLabel1.bottomAnchor, constant: 16),
            datePickerStart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            datePickerStart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            hintLabel2.topAnchor.constraint(equalTo: datePickerStart.bottomAnchor, constant: 32),
            hintLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            hintLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            datePickerEnd.topAnchor.constraint(equalTo: hintLabel2.bottomAnchor, constant: 16),
            datePickerEnd.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            datePickerEnd.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            buttonWrapper.topAnchor.constraint(equalTo: datePickerEnd.bottomAnchor, constant: 32),
            buttonWrapper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            buttonWrapper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            buttonWrapper.heightAnchor.constraint(equalToConstant: 50),
            buttonWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            timeProceedButton.centerYAnchor.constraint(equalTo: buttonWrapper.centerYAnchor),
            timeProceedButton.centerXAnchor.constraint(equalTo: buttonWrapper.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
