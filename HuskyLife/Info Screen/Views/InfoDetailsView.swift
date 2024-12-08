//
//  InfoDetailsView.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit
import Firebase

class InfoDetailsView: UIView {
    var tableViewInfoDetails: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        setupTableViewInfoDetails()
        initConstraints()
    }
    
    func setupTableViewInfoDetails() {
        tableViewInfoDetails = UITableView()
        tableViewInfoDetails.translatesAutoresizingMaskIntoConstraints = false
        tableViewInfoDetails.register(InfoDetailsTableViewCell.self, forCellReuseIdentifier: Configs.infoDetailsTableViewID)
        tableViewInfoDetails.backgroundColor = .clear
        tableViewInfoDetails.separatorStyle = .none
        tableViewInfoDetails.showsVerticalScrollIndicator = false
        tableViewInfoDetails.rowHeight = UITableView.automaticDimension
        tableViewInfoDetails.estimatedRowHeight = 140
        tableViewInfoDetails.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        if #available(iOS 15.0, *) {
            tableViewInfoDetails.sectionHeaderTopPadding = 0
        }
        tableViewInfoDetails.tableFooterView = UIView(frame: .zero)
        self.addSubview(tableViewInfoDetails)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewInfoDetails.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableViewInfoDetails.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableViewInfoDetails.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableViewInfoDetails.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
