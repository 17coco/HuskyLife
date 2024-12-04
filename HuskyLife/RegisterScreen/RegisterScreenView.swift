//
//  RegisterScreenView.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit

class RegisterScreenView: UIView {
    var contentWrapper:UIScrollView!
    var labelHelloThere: UILabel!
    var textFieldEmail: UITextField!
    var textFieldUserName: UITextField!
    var textFieldPassword: UITextField!
    var textFieldConfirmPassword: UITextField!
    var buttonSignup: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        
        setupContentWrapper()
        setupLabelHelloThere()
        setupTextfieldUserName()
        setupTextfieldEmail()
        setupTextfieldPassword()
        setupTextfieldConfirmPassword()
        setupButtonSignup()
        initConstraints()

    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelHelloThere() {
        labelHelloThere = UILabel()
        labelHelloThere.text = "Hello There" // Replace with your actual text
        labelHelloThere.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        labelHelloThere.textColor = .gray
        labelHelloThere.textAlignment = .left
        labelHelloThere.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelHelloThere)
    }
    
    func setupTextfieldUserName(){
        // Username TextField
        textFieldUserName = UITextField()
        textFieldUserName.placeholder = "Username"
        textFieldUserName.borderStyle = .roundedRect
        textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldUserName)
    }

    
    func setupTextfieldEmail(){
        // Username TextField
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupTextfieldPassword(){
        // Password TextField
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword)
    }
    
    func setupTextfieldConfirmPassword(){
        // Password TextField
        textFieldConfirmPassword = UITextField()
        textFieldConfirmPassword.placeholder = "Re-Enter your password"
        textFieldConfirmPassword.borderStyle = .roundedRect
        textFieldConfirmPassword.isSecureTextEntry = true
        textFieldConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldConfirmPassword)
    }
    
    func setupButtonSignup(){
        // Signup Button
        buttonSignup = UIButton(type: .system)
        buttonSignup.setTitle("Sign Up", for: .normal)
        buttonSignup.backgroundColor = .black
        buttonSignup.setTitleColor(.white, for: .normal)
        buttonSignup.layer.cornerRadius = 20
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSignup)
        
    }
    
    func initConstraints() {
            NSLayoutConstraint.activate([
                // Content Wrapper
                contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                contentWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                contentWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                contentWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
                // Label "Hello There"
                labelHelloThere.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                labelHelloThere.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20), // Add padding
                labelHelloThere.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 40),
                
                // First Name TextField
                textFieldUserName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldUserName.topAnchor.constraint(equalTo: labelHelloThere.bottomAnchor, constant: 40),
                textFieldUserName.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldUserName.heightAnchor.constraint(equalToConstant: 40),
                  
                // Email TextField
                textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldEmail.topAnchor.constraint(equalTo: textFieldUserName.bottomAnchor, constant: 20),
                textFieldEmail.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldEmail.heightAnchor.constraint(equalToConstant: 40),
                
                // Password TextField
                textFieldPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
                textFieldPassword.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldPassword.heightAnchor.constraint(equalToConstant: 40),
                
                // Confirm Password TextField
                textFieldConfirmPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldConfirmPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
                textFieldConfirmPassword.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldConfirmPassword.heightAnchor.constraint(equalToConstant: 40),
                
                // Sign Up Button
                buttonSignup.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                buttonSignup.topAnchor.constraint(equalTo: textFieldConfirmPassword.bottomAnchor, constant: 30),
                buttonSignup.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                buttonSignup.heightAnchor.constraint(equalToConstant: 40),
                
                // Bottom Constraint for Scrolling
                buttonSignup.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
            ])
        }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
