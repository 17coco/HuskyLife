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
            trackersTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            trackersTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            trackersTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            trackersTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
