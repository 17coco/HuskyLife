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
       labelHelloThere.text = "Hello There"
       labelHelloThere.font = .systemFont(ofSize: 30, weight: .medium)
       labelHelloThere.textColor = .black
       labelHelloThere.textAlignment = .left
       labelHelloThere.translatesAutoresizingMaskIntoConstraints = false
       contentWrapper.addSubview(labelHelloThere)
    }

    func setupTextfieldUserName(){
       textFieldUserName = UITextField()
       textFieldUserName.placeholder = "Username"
       textFieldUserName.borderStyle = .none
       textFieldUserName.backgroundColor = .systemGray6
       textFieldUserName.layer.cornerRadius = 8
       textFieldUserName.clipsToBounds = true
       textFieldUserName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
       textFieldUserName.leftViewMode = .always
       textFieldUserName.font = .systemFont(ofSize: 16)
       textFieldUserName.autocapitalizationType = .none
       textFieldUserName.autocorrectionType = .no
       textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
       contentWrapper.addSubview(textFieldUserName)
    }

    func setupTextfieldEmail(){
       textFieldEmail = UITextField()
       textFieldEmail.placeholder = "Email"
       textFieldEmail.borderStyle = .none
       textFieldEmail.backgroundColor = .systemGray6
       textFieldEmail.layer.cornerRadius = 8
       textFieldEmail.clipsToBounds = true
       textFieldEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
       textFieldEmail.leftViewMode = .always
       textFieldEmail.font = .systemFont(ofSize: 16)
       textFieldEmail.keyboardType = .emailAddress
       textFieldEmail.autocapitalizationType = .none
       textFieldEmail.autocorrectionType = .no
       textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
       contentWrapper.addSubview(textFieldEmail)
    }

    func setupTextfieldPassword(){
       textFieldPassword = UITextField()
       textFieldPassword.placeholder = "Password"
       textFieldPassword.borderStyle = .none
       textFieldPassword.backgroundColor = .systemGray6
       textFieldPassword.layer.cornerRadius = 8
       textFieldPassword.clipsToBounds = true
       textFieldPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
       textFieldPassword.leftViewMode = .always
       textFieldPassword.font = .systemFont(ofSize: 16)
       textFieldPassword.isSecureTextEntry = true
       textFieldPassword.autocapitalizationType = .none
       textFieldPassword.autocorrectionType = .no
       textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
       contentWrapper.addSubview(textFieldPassword)
    }

    func setupTextfieldConfirmPassword(){
       textFieldConfirmPassword = UITextField()
       textFieldConfirmPassword.placeholder = "Re-Enter your password"
       textFieldConfirmPassword.borderStyle = .none
       textFieldConfirmPassword.backgroundColor = .systemGray6
       textFieldConfirmPassword.layer.cornerRadius = 8
       textFieldConfirmPassword.clipsToBounds = true
       textFieldConfirmPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
       textFieldConfirmPassword.leftViewMode = .always
       textFieldConfirmPassword.font = .systemFont(ofSize: 16)
       textFieldConfirmPassword.isSecureTextEntry = true
       textFieldConfirmPassword.autocapitalizationType = .none
       textFieldConfirmPassword.autocorrectionType = .no
       textFieldConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
       contentWrapper.addSubview(textFieldConfirmPassword)
    }

    func setupButtonSignup(){
       buttonSignup = UIButton(type: .system)
       buttonSignup.setTitle("Sign Up", for: .normal)
       buttonSignup.backgroundColor = .black
       buttonSignup.setTitleColor(.white, for: .normal)
       buttonSignup.layer.cornerRadius = 8
       buttonSignup.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
       buttonSignup.layer.shadowColor = UIColor.black.cgColor
       buttonSignup.layer.shadowOffset = CGSize(width: 0, height: 2)
       buttonSignup.layer.shadowRadius = 4
       buttonSignup.layer.shadowOpacity = 0.1
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
                
                labelHelloThere.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                labelHelloThere.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 40),

                textFieldUserName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldUserName.topAnchor.constraint(equalTo: labelHelloThere.bottomAnchor, constant: 40),
                textFieldUserName.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldUserName.heightAnchor.constraint(equalToConstant: 50),

                textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldEmail.topAnchor.constraint(equalTo: textFieldUserName.bottomAnchor, constant: 20),
                textFieldEmail.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldEmail.heightAnchor.constraint(equalToConstant: 50),
                
                textFieldPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
                textFieldPassword.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldPassword.heightAnchor.constraint(equalToConstant: 50),

                textFieldConfirmPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                textFieldConfirmPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
                textFieldConfirmPassword.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                textFieldConfirmPassword.heightAnchor.constraint(equalToConstant: 50),

                buttonSignup.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
                buttonSignup.topAnchor.constraint(equalTo: textFieldConfirmPassword.bottomAnchor, constant: 30),
                buttonSignup.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
                buttonSignup.heightAnchor.constraint(equalToConstant: 50),

                buttonSignup.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
            ])
        }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
