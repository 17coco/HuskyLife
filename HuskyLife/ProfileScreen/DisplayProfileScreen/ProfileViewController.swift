//
//  ProfileViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let profileScreen = ProfileScreenView()
    let db = Firestore.firestore()
    var handleAuth: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleAuth = Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                print("No user is signed in.")
            } else {
                guard let userEmail = user?.email else { return }
                self.checkOrCreateProfile(for: userEmail)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileScreen
        title = "My Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(editProfile)
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc func editProfile() {
        let editScreen = EditProfileViewController()
        navigationController?.pushViewController(editScreen, animated: true)
    }
    

    func checkOrCreateProfile(for userEmail: String) {
        // Ensure email is consistently lowercase to avoid duplicates
        let normalizedEmail = userEmail.lowercased()
        let userDocument = db.collection("users").document(normalizedEmail)

        // Check for the profile subcollection directly
        userDocument.collection("profile").document("default_profile").getDocument { documentSnapshot, error in
            if let error = error {
                print("Error checking profile document: \(error)")
                return
            }

            if let document = documentSnapshot, document.exists {
                print("Profile exists. Observing changes.")
                self.observeProfileChanges(for: normalizedEmail)
            } else {
                print("Profile does not exist. Creating default profile.")
                self.createDefaultProfile(for: normalizedEmail)
            }
        }
    }

    func createDefaultProfile(for userEmail: String) {
        let profileDocument = db.collection("users").document(userEmail).collection("profile").document("default_profile")

        // Define the default profile data
        let defaultProfile = Profile(
            name: "Default Name",
            email: userEmail,
            dateOfBirth: "Not set",
            country: "Not set"
        )

        do {
            // Add the default profile document to Firestore
            try profileDocument.setData(from: defaultProfile) { error in
                if let error = error {
                    print("Error adding profile: \(error)")
                } else {
                    print("Default profile created successfully!")
                    self.observeProfileChanges(for: userEmail)
                }
            }
        } catch {
            print("Error serializing profile: \(error)")
        }
    }

    func observeProfileChanges(for userEmail: String) {
        let profileDocument = db.collection("users").document(userEmail).collection("profile").document("default_profile")

        profileDocument.addSnapshotListener { documentSnapshot, error in
            if let error = error {
                print("Error observing profile document: \(error)")
            } else if let document = documentSnapshot, document.exists {
                do {
                    let profile = try document.data(as: Profile.self)
                    self.updateUI(with: profile)
                } catch {
                    print("Error decoding profile: \(error)")
                }
            }
        }
    }


    func updateUI(with profile: Profile) {
            self.profileScreen.labelName.text = "Name: \(profile.name)"
            self.profileScreen.labelEmail.text = "Email: \(profile.email)"
            self.profileScreen.labelDob.text = "Date of Birth: \(profile.dateOfBirth)"
            self.profileScreen.labelCountry.text = "Country/Region: \(profile.country)"
    }

 
}
