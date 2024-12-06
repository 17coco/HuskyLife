//
//  EditProfileScreenView.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 12/1/24.
//


import UIKit

class EditProfileScreenView: UIView {
    
    var contentWrapper: UIScrollView!
    var imageProfile: UIImageView!
    var buttonCamera: UIButton!
    var labelName: UILabel!
    var textFieldName: UITextField!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelDob: UILabel!
    var dropdownButtonDob: UIButton!
    var labelCountry: UILabel!
    var dropdownButtonCountry: UIButton!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        setupContentWrapper()
        setupProfileImageView()
        setupFieldsAndLabels()
        setupSaveButton()
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentWrapper)
    }
    
    func setupProfileImageView() {
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "person.circle.fill")
        imageProfile.tintColor = .systemBlue
        imageProfile.contentMode = .scaleAspectFit
        imageProfile.layer.cornerRadius = 60
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.borderWidth = 1
        imageProfile.clipsToBounds = true
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imageProfile)
        
        buttonCamera = UIButton(type: .system)
        buttonCamera.setImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        buttonCamera.tintColor = .black
        buttonCamera.translatesAutoresizingMaskIntoConstraints = false
        buttonCamera.showsMenuAsPrimaryAction = true
        contentWrapper.addSubview(buttonCamera)
    }
    
    func setupFieldsAndLabels() {
        labelName = createLabel(withText: "Name:")
        textFieldName = createTextField(placeholder: "Enter your name")
        
        labelEmail = createLabel(withText: "Email:")
        textFieldEmail = createTextField(placeholder: "Enter your email")
        
        labelDob = createLabel(withText: "Date of Birth:")
        dropdownButtonDob = createDropdownButton(title: "Select date of birth")
        
        labelCountry = createLabel(withText: "Country/Region:")
        dropdownButtonCountry = createDropdownButton(title: "Select country/region")
    }
    
    func setupSaveButton() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save changes", for: .normal)
        buttonSave.backgroundColor = .black
        buttonSave.setTitleColor(.white, for: .normal)
        buttonSave.layer.cornerRadius = 8
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSave)
    }
    
    func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(label)
        return label
    }
    
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textField)
        return textField
    }
    
    func createDropdownButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .left
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(button)
        return button
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Content Wrapper
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Profile Image
            imageProfile.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imageProfile.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 20),
            imageProfile.widthAnchor.constraint(equalToConstant: 120),
            imageProfile.heightAnchor.constraint(equalToConstant: 120),
            
            // Camera Button
            buttonCamera.widthAnchor.constraint(equalToConstant: 30),
            buttonCamera.heightAnchor.constraint(equalToConstant: 30),
            buttonCamera.bottomAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 5),
            buttonCamera.trailingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 5),
            
            // Name Label & TextField
            labelName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelName.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 30),
            
            textFieldName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            textFieldName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            textFieldName.heightAnchor.constraint(equalToConstant: 50),
            textFieldName.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9), // Fixed width
            
            // Email Label & TextField
            labelEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            
            textFieldEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 50),
            textFieldEmail.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9), // Fixed width
            
            
            // DOB Label & Dropdown
            labelDob.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelDob.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            
            dropdownButtonDob.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            dropdownButtonDob.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            dropdownButtonDob.topAnchor.constraint(equalTo: labelDob.bottomAnchor, constant: 8),
            dropdownButtonDob.heightAnchor.constraint(equalToConstant: 50),
            dropdownButtonDob.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9), // Fixed width
            
            // Country Label & Dropdown
            labelCountry.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            labelCountry.topAnchor.constraint(equalTo: dropdownButtonDob.bottomAnchor, constant: 20),
            
            dropdownButtonCountry.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            dropdownButtonCountry.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            dropdownButtonCountry.topAnchor.constraint(equalTo: labelCountry.bottomAnchor, constant: 8),
            dropdownButtonCountry.heightAnchor.constraint(equalToConstant: 50),
            dropdownButtonCountry.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9), // Fixed width
            
            // Save Button
            buttonSave.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonSave.topAnchor.constraint(equalTo: dropdownButtonCountry.bottomAnchor, constant: 30),
            buttonSave.heightAnchor.constraint(equalToConstant: 50),
            buttonSave.widthAnchor.constraint(equalToConstant: 200),
            buttonSave.bottomAnchor.constraint(lessThanOrEqualTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
