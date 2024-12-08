//
//  TrackerSessionView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class TrackerSessionView: UIView {

    var trackerSessionsTableView:UITableView!
    
    func setuptrackersTableView(){
        trackerSessionsTableView = UITableView()
        trackerSessionsTableView.backgroundColor = .white
        trackerSessionsTableView.register(TrackerSessionTableViewCell.self, forCellReuseIdentifier: Configs.sessionTableViewID)
        trackerSessionsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(trackerSessionsTableView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setuptrackersTableView()
        
        NSLayoutConstraint.activate([
            trackerSessionsTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            trackerSessionsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            trackerSessionsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trackerSessionsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
