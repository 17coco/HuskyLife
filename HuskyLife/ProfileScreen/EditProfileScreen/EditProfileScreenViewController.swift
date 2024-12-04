//
//  EditProfileScreenViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 12/1/24.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseAuth

class EditProfileViewController: UIViewController {

    var pickedImage:UIImage?
    let editProfileScreen = EditProfileScreenView()
    let db = Firestore.firestore()

    override func loadView() {
        view = editProfileScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileScreen.buttonCamera.menu = getMenuImagePicker()

        // Add action to the "Date of Birth" button
        editProfileScreen.dropdownButtonDob.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        // Add action to the "Country/Region" button
            editProfileScreen.dropdownButtonCountry.addTarget(self, action: #selector(showCountryPicker), for: .touchUpInside)
        editProfileScreen.buttonSave.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        }
    

    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickPhotoFromGallery(){
        
        var configuration = PHPickerConfiguration()
                configuration.filter = PHPickerFilter.any(of: [.images])
                configuration.selectionLimit = 1
                
                let photoPicker = PHPickerViewController(configuration: configuration)
                
                photoPicker.delegate = self
                present(photoPicker, animated: true, completion: nil)
            
        }
    
    func pickUsingCamera(){
        
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
            
        }

    @objc func showDatePicker() {
        // Create an alert controller to present the date picker
        let alert = UIAlertController(title: "Select Date of Birth", message: "\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        // Add the UIDatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // Optional: Set max/min dates for the picker
        let calendar = Calendar.current
        let currentDate = Date()
        var components = DateComponents()
        components.year = -18
        let maxDate = calendar.date(byAdding: components, to: currentDate)
        datePicker.maximumDate = maxDate

        components.year = -100
        let minDate = calendar.date(byAdding: components, to: currentDate)
        datePicker.minimumDate = minDate

        alert.view.addSubview(datePicker)

        // Add constraints to the date picker
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -20),
            datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 45),
            datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])

        // Add actions to the alert controller
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            // Format the selected date and update the button's title
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let selectedDate = dateFormatter.string(from: datePicker.date)
            self.editProfileScreen.dropdownButtonDob.setTitle(selectedDate, for: .normal)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)

        // Present the alert controller
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func showCountryPicker() {
        let countryPicker = CountryPickerViewController()
            countryPicker.onSelectCountry = { selectedCountry in
                self.editProfileScreen.dropdownButtonCountry.setTitle(selectedCountry, for: .normal)
            }
            let navController = UINavigationController(rootViewController: countryPicker)
            present(navController, animated: true, completion: nil)
    }
}
extension EditProfileViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.editProfileScreen.imageProfile.image = uwImage
                            self.editProfileScreen.imageProfile.contentMode = .scaleAspectFill
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
    
    @objc func saveProfile() {
            guard let userEmail = Auth.auth().currentUser?.email else {
                print("No user logged in")
                return
            }
            
            let profileRef = db.collection("users").document(userEmail).collection("profile").document("default_profile")
            
            // Gather all data from the fields
            let name = editProfileScreen.textFieldName.text ?? "Default Name"
            let email = editProfileScreen.textFieldEmail.text ?? userEmail
            let dateOfBirth = editProfileScreen.dropdownButtonDob.title(for: .normal) ?? "Not Set"
            let country = editProfileScreen.dropdownButtonCountry.title(for: .normal) ?? "Not Set"
            
            // Profile dictionary
            let profileData: [String: Any] = [
                "name": name,
                "email": email,
                "dateOfBirth": dateOfBirth,
                "country": country
            ]
            
            // Update Firestore
            profileRef.setData(profileData) { error in
                if let error = error {
                    print("Error updating profile: \(error.localizedDescription)")
                } else {
                    print("Profile updated successfully")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
}
extension EditProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            
            self.editProfileScreen.imageProfile.image = image
            self.editProfileScreen.imageProfile.contentMode = .scaleAspectFill
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
    
}


