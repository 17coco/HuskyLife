//
//  EditProfileViewController.swift
//  HuskyLife
//
//  Created by Beihan Zhou on 12/1/24.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class EditProfileViewController: UIViewController {
    
    var pickedImage: UIImage?
    let editProfileScreen = EditProfileScreenView()
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let registerScreen = RegisterScreenView()
    let childProgressView = ProgressSpinnerViewController()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showActivityIndicator()
        loadProfileData()
    }
    override func loadView() {
        childProgressView.isOpaque = true
        view = editProfileScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileScreen.buttonCamera.menu = getMenuImagePicker()
        
        // Add actions for buttons
        editProfileScreen.dropdownButtonDob.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        editProfileScreen.dropdownButtonCountry.addTarget(self, action: #selector(showCountryPicker), for: .touchUpInside)
        editProfileScreen.buttonSave.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        
        navigationItem.backBarButtonItem?.tintColor = .black
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)

    }

    func loadProfileData() {
        guard let userEmail = Auth.auth().currentUser?.email else {
            print("No user logged in")
            hideActivityIndicator()
            return
        }

        let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")

        profileRef.getDocument { document, error in
            if let error = error {
                print("Error fetching profile: \(error.localizedDescription)")
                self.hideActivityIndicator() // Hide spinner immediately if fetching profile fails
                return
            }

            if let document = document, document.exists, let data = document.data() {
                DispatchQueue.main.async {
                    self.editProfileScreen.textFieldName.text = data["name"] as? String ?? ""
                    self.editProfileScreen.textFieldEmail.text = data["email"] as? String ?? userEmail
                    self.editProfileScreen.dropdownButtonDob.setTitle(data["dateOfBirth"] as? String ?? "Not Set", for: .normal)
                    self.editProfileScreen.dropdownButtonCountry.setTitle(data["country"] as? String ?? "Not Set", for: .normal)

                    // Check if there's an image URL
                    if let imageUrl = data["imageUrl"] as? String, !imageUrl.isEmpty {
                        self.loadProfileImage(from: imageUrl)
                    } else {
                        // No image URL, set default image
                        self.editProfileScreen.imageProfile.image = UIImage(systemName: "person.circle.fill")
                        self.hideActivityIndicator() // Hide spinner after setting default image
                    }
                }
            } else {
                self.hideActivityIndicator() // Hide spinner if no document exists
            }
        }
    }

    func loadProfileImage(from url: String) {
        let storageRef = storage.reference(forURL: url)
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error fetching image: \(error.localizedDescription)")
                self.hideActivityIndicator() // Hide spinner if image fails to load
                return
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.editProfileScreen.imageProfile.image = image
                    self.editProfileScreen.imageProfile.contentMode = .scaleAspectFill
                    self.hideActivityIndicator() // Hide spinner after image is loaded
                }
            } else {
                self.hideActivityIndicator() // Hide spinner if no image is found
            }
        }
    }

    
    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: { _ in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: { _ in
                self.pickPhotoFromGallery()
            })
        ]
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        present(photoPicker, animated: true)
    }
    
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }

    @objc func showDatePicker() {
        let alert = UIAlertController(title: "Select Date of Birth", message: "\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        let dobPicker = UIDatePicker()
        dobPicker.datePickerMode = .date
        dobPicker.preferredDatePickerStyle = .wheels
        dobPicker.translatesAutoresizingMaskIntoConstraints = false
        dobPicker.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        dobPicker.maximumDate = Calendar.current.date(byAdding: .year, value: 10, to: Date())
        
        alert.view.addSubview(dobPicker)
        
        NSLayoutConstraint.activate([
            dobPicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 20),
            dobPicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -20),
            dobPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 45),
            dobPicker.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let selectedDate = dateFormatter.string(from: dobPicker.date)
            self.editProfileScreen.dropdownButtonDob.setTitle(selectedDate, for: .normal)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @objc func showCountryPicker() {
        let countryPicker = CountryPickerViewController()
        countryPicker.onSelectCountry = { selectedCountry in
            self.editProfileScreen.dropdownButtonCountry.setTitle(selectedCountry, for: .normal)
        }
        let navController = UINavigationController(rootViewController: countryPicker)
        present(navController, animated: true)
    }

    
    @objc func saveProfile() {
        // Validate text fields
        guard let name = editProfileScreen.textFieldName.text, !name.isEmpty,
              let email = editProfileScreen.textFieldEmail.text, !email.isEmpty,
              let dateOfBirth = editProfileScreen.dropdownButtonDob.title(for: .normal), dateOfBirth != "Not Set",
              let country = editProfileScreen.dropdownButtonCountry.title(for: .normal), country != "Not Set" else {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
            return
        }

        // Validate email format
        if !isValidEmail(email) {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return
        }

        childProgressView.isOpaque = false
        guard let userEmail = Auth.auth().currentUser?.email else {
            print("No user logged in")
            return
        }

        let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")
        let storageRef = storage.reference().child("profile_images").child("\(userEmail).jpg")

        // Update profile fields without changing the image URL
        var profileData: [String: Any] = [
            "name": name,
            "email": email,
            "dateOfBirth": dateOfBirth,
            "country": country
        ]

        if let pickedImage = self.pickedImage {
            // Upload new image
            if let imageData = pickedImage.jpegData(compressionQuality: 0.8) {
                showActivityIndicator()
                storageRef.putData(imageData, metadata: nil) { metadata, error in
                    self.hideActivityIndicator()

                    if let error = error {
                        print("Error uploading image: \(error.localizedDescription)")
                        return
                    }

                    storageRef.downloadURL { url, error in
                        if let error = error {
                            print("Error getting download URL: \(error.localizedDescription)")
                            return
                        }
                        if let imageUrl = url?.absoluteString {
                            profileData["imageUrl"] = imageUrl
                            profileRef.setData(profileData) { error in
                                if let error = error {
                                    print("Error saving profile: \(error.localizedDescription)")
                                } else {
                                    self.showAlert(title: "Success!", message: "Your profile has been saved successfully.") {
                                        self.navigationController?.popViewController(animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            // Preserve the existing image URL
            profileRef.getDocument { document, error in
                if let error = error {
                    print("Error fetching existing profile: \(error.localizedDescription)")
                    return
                }

                if let document = document, let data = document.data(), let existingImageUrl = data["imageUrl"] as? String {
                    profileData["imageUrl"] = existingImageUrl
                }

                profileRef.setData(profileData) { error in
                    if let error = error {
                        print("Error saving profile: \(error.localizedDescription)")
                    } else {
                        self.showAlert(title: "Success!", message: "Your profile has been saved successfully.") {
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
        }
    }


    
    // Helper function to validate email format
    // I use this post as a reference when writing this method https://stackoverflow.com/questions/25471114
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Helper function to show alerts
    func showAlert(title: String, message: String, onCompletion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            onCompletion?()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
}

extension EditProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
        provider.loadObject(ofClass: UIImage.self) { object, _ in
            DispatchQueue.main.async {
                if let image = object as? UIImage {
                    self.editProfileScreen.imageProfile.image = image
                    self.editProfileScreen.imageProfile.contentMode = .scaleAspectFill
                    self.pickedImage = image
                }
            }
        }
    }
    
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            self.editProfileScreen.imageProfile.image = image
            self.editProfileScreen.imageProfile.contentMode = .scaleAspectFill
            self.pickedImage = image
        }
    }
}
