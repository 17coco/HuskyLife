//
//  ViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou on 11/26/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    let loginScreen = LoginScreenView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setupActions()
    }
    
    func setupActions() {
        // Add button actions
        loginScreen.buttonLogin.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginScreen.buttonSignup.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        guard let email = loginScreen.textfieldEmail.text, !email.isEmpty,
              let password = loginScreen.textfieldPassword.text, !password.isEmpty else {
            showAlert(title: "Missing Information", message: "Please enter both email and password.")
            return
        }
        
        // Validate email format
        if !isValidEmail(email) {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        signIn(email: email, password: password)
    }
    
    @objc func signupButtonTapped() {
        let registerScreen = RegisterScreenViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    func signIn(email: String, password: String) {
        showActivityIndicator()
        
        // Perform Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            self.hideActivityIndicator()
            
            if let error = error as NSError? {
                // Handle error
                switch AuthErrorCode(rawValue: error.code) {
                case .invalidEmail:
                    self.showAlert(title: "Invalid Email", message: "The email address is badly formatted.")
                case .wrongPassword:
                    self.showAlert(title: "Incorrect Password", message: "The password you entered is incorrect.")
                case .userNotFound:
                    self.showAlert(title: "User Not Found", message: "No account found with this email address.")
                default:
                    self.showAlert(title: "Login Failed", message: error.localizedDescription)
                }
                return
            }
            
            // Handle successful login
            if let user = authResult?.user {
                print("User signed in successfully: \(user.email ?? "No Email")")
                
                // Navigate to BottomTabBarController
                self.switchToTabBar()
            }
        }
    }
    
    func switchToTabBar() {
        // Replace the root view controller with BottomTabBarController
        let tabBarController = BottomTabBarController()
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
}
