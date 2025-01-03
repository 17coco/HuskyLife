//
//  sessionDetail.swift
//  ExampleProject
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class sessionDetail: UIView {
    
    var contentWrapper: UIScrollView!
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
        backgroundColor = .systemBackground
        setupContentWrapper()
        setupLabels()
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabels() {
        labelName = createLabel(withText: "Theme: ", isBold: true)
        labelEmail = createLabel(withText: "Start: ", isBold: true)
        labelSchool = createLabel(withText: "End: ", isBold: true)
        labelDob = createLabel(withText: "Time Elapsed: ", isBold: true)
        labelCountry = createLabel(withText: "Content: ", isBold: true)
    }
    
    func createLabel(withText text: String, isBold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(label)
        return label
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labelName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 60),
            
            labelEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            
            labelSchool.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelSchool.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 20),
            
            labelDob.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelDob.topAnchor.constraint(equalTo: labelSchool.bottomAnchor, constant: 20),
            
            labelCountry.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            labelCountry.topAnchor.constraint(equalTo: labelDob.bottomAnchor, constant: 20),
            labelCountry.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
