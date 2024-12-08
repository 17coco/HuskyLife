//
//  ProfileViewController.swift
//  HuskyLife
//
//  Created by Beihan Zhou on 11/25/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class ProfileViewController: UIViewController {
    
    let profileScreen = ProfileScreenView()
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let childProgressView = ProgressSpinnerViewController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showActivityIndicator()
        checkOrCreateProfile()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        childProgressView.isOpaque = true
        view = profileScreen
        setupRightBarButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit",style: .plain,target: self,action:#selector(editProfile))
        
    }
    
    @objc func editProfile() {
        let editScreen = EditProfileViewController()
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    // Check if profile exists, create default if not
    func checkOrCreateProfile() {
        guard let userEmail = Auth.auth().currentUser?.email else {
            print("No user logged in")
            hideActivityIndicator()
            return
        }
        
        let userName = Auth.auth().currentUser?.displayName ?? "Default Name"
        
        let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")
        
        profileRef.getDocument { document, error in
            if let error = error {
                print("\(error.localizedDescription)")
                self.hideActivityIndicator()
                return
            }
            
            if let document = document, document.exists {
                print("Profile exists. Load data")
                self.loadProfile(for: userEmail)
            } else {
                print("Profile does not exist, Create default profile")
                self.createDefaultProfile(for: userEmail)
            }
        }
    }
    
    func createDefaultProfile(for userEmail: String) {
        let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")
        
        let userName = Auth.auth().currentUser?.displayName ?? "Default Name"
        
        let defaultProfile: [String: Any] = [
            "name": userName,
            "email": userEmail,
            "dateOfBirth": "Not Set",
            "country": "Not Set",
            "imageUrl": "" // No image URL for the default profile
        ]
        
        profileRef.setData(defaultProfile) { error in
            if let error = error {
                print("Error creating default profile: \(error.localizedDescription)")
            } else {
                print("Default profile created successfully.")
                self.loadProfile(for: userEmail)
            }
        }
    }
    
    func loadProfile(for userEmail: String) {
        let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")
        
        profileRef.getDocument { document, error in
            if let error = error {
                print("Error fetching profile: \(error.localizedDescription)")
                self.hideActivityIndicator()
                return
            }
            
            if let document = document, document.exists, let data = document.data() {
                let profile = Profile(
                    name: data["name"] as? String ?? "Default Name",
                    email: data["email"] as? String ?? "Default Email",
                    dateOfBirth: data["dateOfBirth"] as? String ?? "Not Set",
                    country: data["country"] as? String ?? "Not Set",
                    imageUrl: data["imageUrl"] as? String
                )
                self.updateUI(with: profile)
                
                // Load image if imageUrl exists
                if let imageUrl = profile.imageUrl, !imageUrl.isEmpty {
                    self.loadProfileImage(from: imageUrl)
                } else {
                    self.profileScreen.imageProfile.image = UIImage(systemName: "person.circle")
                    self.hideActivityIndicator() // Hide after profile is updated
                }
            } else {
                print("Profile document does not exist.")
                self.hideActivityIndicator()
            }
        }
    }
    
    func loadProfileImage(from url: String) {
        let storageRef = storage.reference(forURL: url)
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error fetching image: \(error.localizedDescription)")
                self.profileScreen.imageProfile.image = UIImage(systemName: "person.circle") // Default image
                self.hideActivityIndicator()
                return
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.profileScreen.imageProfile.image = image
                    self.profileScreen.imageProfile.contentMode = .scaleAspectFill
                    self.hideActivityIndicator()
                }
            }
        }
    }
    
    func updateUI(with profile: Profile) {
        DispatchQueue.main.async {
            self.profileScreen.labelName.text = "Name: \(profile.name.count > 20 ? String(profile.name.prefix(20)) + "..." : profile.name)"
            self.profileScreen.labelEmail.text = "Email: \(profile.email.count > 20 ? String(profile.email.prefix(20)) + "..." : profile.email)"
            self.profileScreen.labelDob.text = "Date of Birth: \(profile.dateOfBirth)"
            self.profileScreen.labelCountry.text = "Country/Region: \(profile.country)"
        }
    }
}


extension ProfileViewController{
    func setupRightBarButton(){
        
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
            style: .plain,
            target: self,
            action: #selector(onLogOutBarButtonTapped)
        )
        let barText = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(onLogOutBarButtonTapped)
        )
        navigationItem.rightBarButtonItems = [barIcon]
        
    }
    
    @objc func onLogOutBarButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?",
            preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                    let loginScreen = UINavigationController(rootViewController: ViewController())
                    guard let window = UIApplication.shared.windows.first else { return }
                    window.rootViewController = loginScreen
                    window.makeKeyAndVisible()
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
        
    }

}
