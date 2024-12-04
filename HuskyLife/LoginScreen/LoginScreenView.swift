//
//  LoginScreen.swift
//  HuskyLife
//
//  Created by Beihan Zhou on 11/25/24.
//

import UIKit

class LoginScreenView: UIView {

    var contentWrapper: UIScrollView!
    var logo: UIImageView!
    var labelHuskyLife: UILabel!
    var textfieldEmail: UITextField!
    var textfieldPassword: UITextField!
    var buttonLogin: UIButton!
    var buttonSignup: UIButton!
    var labelOr: UILabel!
    var stackView: UIStackView!
    var line1: UIView!
    var line2: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        
        setupContentWrapper()
        
        // Logo
        logo = UIImageView()
        logo.image = UIImage(named: "logo") // Replace with your actual image name
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(logo)

        setupLabelHuskyLife()
        setupTextfieldEmail()
        setupTextfieldPassword()
        setupButtonLogin()
        setupButtonSignup()
        setupLabelOr()
        setupStackView()
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelHuskyLife() {
        labelHuskyLife = UILabel()
        labelHuskyLife.text = "HuskyLife"
        labelHuskyLife.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        labelHuskyLife.textColor = .gray
        labelHuskyLife.textAlignment = .center
        labelHuskyLife.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelHuskyLife)
    }

    func setupTextfieldEmail() {
        textfieldEmail = UITextField()
        textfieldEmail.placeholder = "Email"
        textfieldEmail.borderStyle = .roundedRect
        textfieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textfieldEmail)
    }

    func setupTextfieldPassword() {
        textfieldPassword = UITextField()
        textfieldPassword.placeholder = "Password"
        textfieldPassword.borderStyle = .roundedRect
        textfieldPassword.isSecureTextEntry = true
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textfieldPassword)
    }

    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .black
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.cornerRadius = 20
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonLogin)
    }

    func setupButtonSignup() {
        buttonSignup = UIButton(type: .system)
        buttonSignup.setTitle("Sign Up", for: .normal)
        buttonSignup.backgroundColor = .black
        buttonSignup.setTitleColor(.white, for: .normal)
        buttonSignup.layer.cornerRadius = 20
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSignup)
    }

    func setupLabelOr() {
        labelOr = UILabel()
        labelOr.text = "Or"
        labelOr.textColor = .gray
        labelOr.textAlignment = .center
        labelOr.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupStackView() {
        line1 = UIView()
        line1.backgroundColor = .lightGray

        line2 = UIView()
        line2.backgroundColor = .lightGray

        stackView = UIStackView(arrangedSubviews: [line1, labelOr, line2])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(stackView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Content Wrapper
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Logo
            logo.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 40),
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200),

            // Label "HuskyLife"
            labelHuskyLife.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            labelHuskyLife.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: -40),
            
            // Email TextField
            textfieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textfieldEmail.topAnchor.constraint(equalTo: labelHuskyLife.bottomAnchor, constant: 50),
            textfieldEmail.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            textfieldEmail.heightAnchor.constraint(equalToConstant: 40),

            // Password TextField
            textfieldPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textfieldPassword.topAnchor.constraint(equalTo: textfieldEmail.bottomAnchor, constant: 20),
            textfieldPassword.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            textfieldPassword.heightAnchor.constraint(equalToConstant: 40),

            // Login Button
            buttonLogin.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: textfieldPassword.bottomAnchor, constant: 20),
            buttonLogin.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonLogin.heightAnchor.constraint(equalToConstant: 40),

            // Stack View
            stackView.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),

            // Lines in Stack View
            line1.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4),
            line1.heightAnchor.constraint(equalToConstant: 1),
            line2.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4),
            line2.heightAnchor.constraint(equalToConstant: 1),

            // Signup Button
            buttonSignup.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonSignup.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            buttonSignup.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonSignup.heightAnchor.constraint(equalToConstant: 40),
            buttonSignup.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
