//
//  MainScreenView.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import UIKit

class MainScreenView: UIView {
    var profilePic: UIImageView!
    var labelText: UILabel!
    var floatingButtonAddContact: UIButton!
    var tableViewContacts: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupProfilePic()
        setupLabelText()
        setupFloatingButtonAddContact()
        setupTableViewContacts()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewContacts(){
        tableViewContacts = UITableView()
        tableViewContacts.register(ContactsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewContactsID)
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewContacts)
    }
    
    func setupFloatingButtonAddContact(){
        floatingButtonAddContact = UIButton(type: .system)
        floatingButtonAddContact.setTitle("", for: .normal)
        floatingButtonAddContact.setImage(UIImage(systemName: "person.crop.circle.fill.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonAddContact.contentHorizontalAlignment = .fill
        floatingButtonAddContact.contentVerticalAlignment = .fill
        floatingButtonAddContact.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddContact.layer.cornerRadius = 16
        floatingButtonAddContact.imageView?.layer.shadowOffset = .zero
        floatingButtonAddContact.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddContact.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddContact.imageView?.clipsToBounds = true
        floatingButtonAddContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddContact)
    }
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 32),
            profilePic.heightAnchor.constraint(equalToConstant: 32),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelText.topAnchor.constraint(equalTo: profilePic.topAnchor),
            labelText.bottomAnchor.constraint(equalTo: profilePic.bottomAnchor),
            labelText.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            
            tableViewContacts.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 8),
            tableViewContacts.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewContacts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewContacts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            floatingButtonAddContact.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonAddContact.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonAddContact.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddContact.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
