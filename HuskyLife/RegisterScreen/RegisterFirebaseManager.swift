//
//  RegisterFirebaseManager.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore


extension RegisterScreenViewController {
    
    func registerNewAccount() {
        showActivityIndicator()
        
        if let name = registerScreen.textFieldUserName.text,
           let email = registerScreen.textFieldEmail.text,
           let password = registerScreen.textFieldPassword.text {
            // Create a Firebase user with email and password
            Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                if error == nil {
                    // User creation successful
                    self.setNameOfTheUserInFirebaseAuth(name: name, email: email)
                    self.hideActivityIndicator()
                } else {
                    // Error creating user
                    self.hideActivityIndicator()
                    self.showAlert(title: "Registration Error", message: error?.localizedDescription ?? "Unknown error")
                    print(error?.localizedDescription ?? "Unknown error")
                }
            })
        }
    }
    
    // Set the name of the user in Firebase Auth and add email to Firestore
    func setNameOfTheUserInFirebaseAuth(name: String, email: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: { error in
            if error == nil {
                // Profile update successful
                self.addEmailToFirestore(name: name, email: email)
            } else {
                // Error updating profile
                self.showAlert(title: "Profile Update Error", message: error?.localizedDescription ?? "Unknown error")
                print("Error occurred: \(String(describing: error))")
            }
        })
    }
    
    // Add email to Firestore users collection
    func addEmailToFirestore(name: String, email: String) {
        let db = Firestore.firestore()
        let userDocument: [String: Any] = [
            "name": name,
            "email": email
        ]
        
        db.collection("users").document(email.lowercased()).setData(userDocument) { error in
            
            if let error = error {
                self.showAlert(title: "Firestore Error", message: error.localizedDescription)
                print("Error writing document: \(error)")
            } else {
                self.showAlert(title: "Success", message: "Registration completed successfully!")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
