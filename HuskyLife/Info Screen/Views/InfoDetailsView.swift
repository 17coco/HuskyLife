//
//  InfoDetailsView.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit
import Firebase

class InfoDetailsView: UIView {
    
    // TableView to display information
    var tableViewInfoDetails: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set a subtle dark red background
        self.backgroundColor = UIColor(red: 0.2, green: 0.0, blue: 0.0, alpha: 1.0) // Subtle dark red
        
        setupTableViewInfoDetails()
        initConstraints()
    }
    
    // Setup the table view
    private func setupTableViewInfoDetails() {
        tableViewInfoDetails = UITableView()
        tableViewInfoDetails.translatesAutoresizingMaskIntoConstraints = false
        tableViewInfoDetails.register(InfoDetailsTableViewCell.self, forCellReuseIdentifier: Configs.infoDetailsTableViewID)
        
        // Set the table view's background to a light gray
        tableViewInfoDetails.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0) // Light gray
        tableViewInfoDetails.separatorColor = UIColor.darkGray // Darker separator for contrast
        tableViewInfoDetails.separatorStyle = .singleLine
        tableViewInfoDetails.layer.cornerRadius = 12
        tableViewInfoDetails.clipsToBounds = true
        
        // Dynamic height adjustments
        tableViewInfoDetails.rowHeight = UITableView.automaticDimension
        tableViewInfoDetails.estimatedRowHeight = 120
        
        // Avoid unnecessary footers
        tableViewInfoDetails.tableFooterView = UIView(frame: .zero)
        
        self.addSubview(tableViewInfoDetails)
    }
    
    // Setup constraints
    private func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewInfoDetails.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewInfoDetails.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewInfoDetails.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewInfoDetails.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
