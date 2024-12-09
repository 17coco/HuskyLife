//
//  AddTrackerView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class AddTrackerView: UIView {
    var addLabel: UILabel!
    var nameTextField: UITextField!
    var timeNeededTextField: UITextField!
    var initGoalTextField: UITextField!
    var addButton: UIButton!
    var buttonWrapper: UIView!
    var scrollView: UIScrollView!
    var contentWrapper: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupScrollView()
        setupViews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
        contentWrapper = UIView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentWrapper)
    }
    
    func setupViews() {
        // Setup Title Label
        addLabel = UILabel()
        addLabel.text = "Add Tracker"
        addLabel.font = .systemFont(ofSize: 24, weight: .bold)
        addLabel.textAlignment = .center
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(addLabel)

        nameTextField = createTextField(placeholder: "Task Name", symbolName: "doc.text")
        contentWrapper.addSubview(nameTextField)
        
        timeNeededTextField = createTextField(placeholder: "Time Needed (Hours)", symbolName: "clock")
        contentWrapper.addSubview(timeNeededTextField)
        
        initGoalTextField = createTextField(placeholder: "Enter Your Goal", symbolName: "target")
        contentWrapper.addSubview(initGoalTextField)
        
        buttonWrapper = UIView()
        buttonWrapper.backgroundColor = .systemBlue
        buttonWrapper.layer.cornerRadius = 8
        buttonWrapper.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonWrapper)

        addButton = UIButton(type: .system)
        addButton.setTitle("Finish", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        addButton.setTitleColor(.white, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        buttonWrapper.addSubview(addButton)
    }
    
    func createTextField(placeholder: String, symbolName: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        
        let containerView = UIView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
        let symbolImage = UIImage(systemName: symbolName, withConfiguration: symbolConfig)
        let symbolView = UIImageView(image: symbolImage)
        symbolView.tintColor = .systemGray
        symbolView.contentMode = .center
        containerView.frame = CGRect(x: 0, y: 0, width: 36, height: 20)
        symbolView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        containerView.addSubview(symbolView)
        
        textField.rightView = containerView
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            contentWrapper.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            addLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 12),
            addLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: addLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            timeNeededTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            timeNeededTextField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            timeNeededTextField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            timeNeededTextField.heightAnchor.constraint(equalToConstant: 44),
            
            initGoalTextField.topAnchor.constraint(equalTo: timeNeededTextField.bottomAnchor, constant: 16),
            initGoalTextField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            initGoalTextField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            initGoalTextField.heightAnchor.constraint(equalToConstant: 44),
            buttonWrapper.topAnchor.constraint(equalTo: initGoalTextField.bottomAnchor, constant: 24),
            buttonWrapper.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonWrapper.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            buttonWrapper.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            buttonWrapper.heightAnchor.constraint(equalToConstant: 45),
            buttonWrapper.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: buttonWrapper.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: buttonWrapper.centerYAnchor),
        ])
    }
}
