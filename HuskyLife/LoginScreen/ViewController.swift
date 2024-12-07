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
    
    var currentUser:FirebaseAuth.User?
    let loginScreen = LoginScreenView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setupActions()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)
    }
    
    func setupActions() {
        // Add button actions
        loginScreen.buttonLogin.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginScreen.buttonSignup.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        guard let email = loginScreen.textfieldEmail.text, !email.isEmpty,
              let password = loginScreen.textfieldPassword.text, !password.isEmpty else {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
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
        
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            self.hideActivityIndicator()
            
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .invalidEmail:
                    self.showAlert(title: "Invalid Email", message: "This email address is not valid.")
                case .wrongPassword:
                    self.showAlert(title: "Incorrect Password", message: "The password entered is incorrect.")
                case .userNotFound:
                    self.showAlert(title: "User Not Found", message: "No user found with this email address.")
                default:
                    self.showAlert(title: "Login Failed", message: error.localizedDescription)
                }
                return
            }
            
            // handle login
            if let user = authResult?.user {
                print("user signed in successfully")
                self.currentUser = user
                // jump to BottomTabBarController
                let tabBarController = BottomTabBarController()
                guard let window = UIApplication.shared.windows.first else { return }
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
            }
        }
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
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
