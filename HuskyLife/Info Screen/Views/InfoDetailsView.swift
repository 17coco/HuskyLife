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
        self.backgroundColor = .white
        
        setupTableViewInfoDetails()
        initConstraints()
    }
    
    // Setup the table view
    private func setupTableViewInfoDetails() {
        tableViewInfoDetails = UITableView()
        tableViewInfoDetails.translatesAutoresizingMaskIntoConstraints = false
        tableViewInfoDetails.register(InfoDetailsTableViewCell.self, forCellReuseIdentifier: Configs.infoDetailsTableViewID)
        tableViewInfoDetails.backgroundColor = .white
        tableViewInfoDetails.separatorStyle = .singleLine
        tableViewInfoDetails.rowHeight = UITableView.automaticDimension
        tableViewInfoDetails.estimatedRowHeight = 100
        self.addSubview(tableViewInfoDetails)
    }
    
    // Setup constraints
    private func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewInfoDetails.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableViewInfoDetails.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewInfoDetails.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableViewInfoDetails.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
