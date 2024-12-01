//
//  AddTaskView.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/30/24.
//

import UIKit

class AddTaskView: UIView {
    var titleLabel: UILabel!
    var taskNameField: UITextField!
    var dateField: UITextField!
    var startTimeField: UITextField!
    var endTimeField: UITextField!
    var saveButton: UIButton!
    var dismissButton: UIButton!
    var datePicker: UIDatePicker!
    var startTimePicker: UIDatePicker!
    var endTimePicker: UIDatePicker!
    var scrollView: UIScrollView!
    var contentWrapper: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupScrollView()
        setupTitleLabel()
        setupTaskNameField()
        setupDateField()
        setupStartTimeField()
        setupEndTimeField()
        setupDatePicker()
        setupStartTimePicker()
        setupEndTimePicker()
        setupSaveButton()
        setupDismissButton()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        contentWrapper = UIView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentWrapper)
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Add New Task"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(titleLabel)
    }
    
    func setupTaskNameField() {
        taskNameField = UITextField()
        taskNameField.placeholder = "Task Name"
        taskNameField.borderStyle = .roundedRect
        taskNameField.backgroundColor = .systemGray6
        taskNameField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(taskNameField)
    }
    
    func setupDateField() {
        dateField = createTextField(placeholder: "Date", symbolName: "calendar")
        contentWrapper.addSubview(dateField)
    }
    
    func setupStartTimeField() {
        startTimeField = createTextField(placeholder: "Start Time", symbolName: "clock")
        contentWrapper.addSubview(startTimeField)
    }
    
    func setupEndTimeField() {
        endTimeField = createTextField(placeholder: "End Time", symbolName: "clock")
        contentWrapper.addSubview(endTimeField)
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        dateField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    func setupStartTimePicker() {
        startTimePicker = UIDatePicker()
        startTimePicker.datePickerMode = .time
        startTimePicker.preferredDatePickerStyle = .wheels
        startTimeField.inputView = startTimePicker
        startTimePicker.addTarget(self, action: #selector(startTimeChanged), for: .valueChanged)
    }
    
    func setupEndTimePicker() {
        endTimePicker = UIDatePicker()
        endTimePicker.datePickerMode = .time
        endTimePicker.preferredDatePickerStyle = .wheels
        endTimeField.inputView = endTimePicker
        endTimePicker.addTarget(self, action: #selector(endTimeChanged), for: .valueChanged)
    }
    
    func setupSaveButton() {
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 8
        saveButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(saveButton)
    }
    
    func setupDismissButton() {
        dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Cancel", for: .normal)
        dismissButton.backgroundColor = .systemGray6
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.layer.cornerRadius = 8
        dismissButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(dismissButton)
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
    
    @objc func dateChanged() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func startTimeChanged() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        startTimeField.text = formatter.string(from: startTimePicker.date)
    }
    
    @objc func endTimeChanged() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        endTimeField.text = formatter.string(from: endTimePicker.date)
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
            
            titleLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            
            taskNameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            taskNameField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            taskNameField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            taskNameField.heightAnchor.constraint(equalToConstant: 44),
            
            dateField.topAnchor.constraint(equalTo: taskNameField.bottomAnchor, constant: 16),
            dateField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            dateField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            dateField.heightAnchor.constraint(equalToConstant: 44),
            
            startTimeField.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 16),
            startTimeField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            startTimeField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            startTimeField.heightAnchor.constraint(equalToConstant: 44),
            
            endTimeField.topAnchor.constraint(equalTo: startTimeField.bottomAnchor, constant: 16),
            endTimeField.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            endTimeField.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            endTimeField.heightAnchor.constraint(equalToConstant: 44),
            
            saveButton.topAnchor.constraint(equalTo: endTimeField.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 45),
            
            dismissButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 12),
            dismissButton.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            dismissButton.heightAnchor.constraint(equalToConstant: 45),
            dismissButton.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }
}
