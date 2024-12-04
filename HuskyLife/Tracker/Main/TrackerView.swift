//
//  TrackerView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class TrackerView: UIView {

    var trackersTableView:UITableView!
    
    func setuptrackersTableView(){
        trackersTableView = UITableView()
        trackersTableView.backgroundColor = .white
        trackersTableView.register(TrackerTableViewCell.self, forCellReuseIdentifier: Configs.trackerTableViewID)
        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(trackersTableView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setuptrackersTableView()
        
        NSLayoutConstraint.activate([
            trackersTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            trackersTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            trackersTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trackersTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
