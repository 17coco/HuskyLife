//
//  RegisterScreenViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    let registerScreen = RegisterScreenView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerScreen.buttonSignup.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func signupButtonTapped() {
        guard let username = registerScreen.textFieldUserName.text, !username.isEmpty,
              let email = registerScreen.textFieldEmail.text, !email.isEmpty,
              let password = registerScreen.textFieldPassword.text, !password.isEmpty,
              let confirmPassword = registerScreen.textFieldConfirmPassword.text, !confirmPassword.isEmpty else {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
            return
        }
        
        // Validate email format
        if !isValidEmail(email) {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        // Check if passwords match
        if password != confirmPassword {
            showAlert(title: "Incorrect password", message: "Passwords do not match.")
            return
        }
        
        registerNewAccount()
    
    }
    
    // Helper function to validate email format
    // I use this post as a reference when writing this method https://stackoverflow.com/questions/25471114
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Helper function to show alerts
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
}
