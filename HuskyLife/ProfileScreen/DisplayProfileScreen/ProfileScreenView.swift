//
//  ProfileScreenView.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 12/1/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileScreenView: UIView {
    
    var contentWrapper:UIScrollView!
    var imageProfile: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelSchool: UILabel!
    var labelDob: UILabel!
    var labelCountry: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        
        setupContentWrapper()
        setupProfileImageView()
        setupLabels()
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupProfileImageView() {
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "person.circle")
        imageProfile.contentMode = .scaleAspectFit
        imageProfile.layer.cornerRadius = 75
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.borderWidth = 1
        imageProfile.clipsToBounds = true
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imageProfile)
    }
    
    
    func setupLabels() {
        labelName = createLabel(withText: "Name:", isBold: true)
        labelEmail = createLabel(withText: "Email:", isBold: true)
        labelSchool = createLabel(withText: "School: Northeastern University", isBold: true)
        labelDob = createLabel(withText: "Date of Birth:", isBold: true)
        labelCountry = createLabel(withText: "Country/Region:", isBold: true)
    }
    
    func createLabel(withText text: String, isBold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(label)
        return label
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Content Wrapper
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Profile Image
            imageProfile.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imageProfile.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 60),
            imageProfile.widthAnchor.constraint(equalToConstant: 150),
            imageProfile.heightAnchor.constraint(equalToConstant: 150),
            
            // Name Label
            labelName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelName.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 50),
            
            // Email Label
            labelEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            
            // School Label
            labelSchool.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelSchool.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 20),
            
            // DOB Label
            labelDob.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelDob.topAnchor.constraint(equalTo: labelSchool.bottomAnchor, constant: 20),
            
            // Country Label
            labelCountry.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelCountry.topAnchor.constraint(equalTo: labelDob.bottomAnchor, constant: 20),
            labelCountry.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
