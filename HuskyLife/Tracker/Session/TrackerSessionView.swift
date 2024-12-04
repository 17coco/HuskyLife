//
//  TrackerSessionView.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class TrackerSessionView: UIView {

    var trackerSessionsTableView:UITableView!
    //var buttonWrapper:UIView!
    var buttonNewSession:UIButton!
    
    func setuptrackersTableView(){
        trackerSessionsTableView = UITableView()
        trackerSessionsTableView.backgroundColor = .white
        trackerSessionsTableView.register(TrackerSessionTableViewCell.self, forCellReuseIdentifier: Configs.sessionTableViewID)
        trackerSessionsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(trackerSessionsTableView)
    }
    
    func setupButtonNewSession(){
        buttonNewSession = UIButton(type:.system)
        buttonNewSession.setTitle("New Session", for: .normal)
        //buttonNewSession.setTitleColor(.black, for: .normal)
        //buttonNewSession.backgroundColor = .black
        buttonNewSession.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonNewSession)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setuptrackersTableView()
        setupButtonNewSession()
        
        NSLayoutConstraint.activate([
            trackerSessionsTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            trackerSessionsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            trackerSessionsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trackerSessionsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonNewSession.topAnchor.constraint(equalTo: self.trackerSessionsTableView.bottomAnchor, constant: 16),
            buttonNewSession.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            buttonNewSession.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            //buttonNewSession.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonNewSession.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
