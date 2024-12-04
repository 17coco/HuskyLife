//
//  TrackerCellManager.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/29.
//

import Foundation
import UIKit

extension TrackerMainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.trackerTableViewID, for: indexPath) as! TrackerTableViewCell
        cell.labelName.text = trackers[indexPath.row].name
        cell.labelHours.text = "\(trackers[indexPath.row].timeSpent)"
        cell.labelGoal.text = "Current Goal: \(trackers[indexPath.row].currentGoal)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startSessionView(tracker: self.trackers[indexPath.row])
        print(self.trackers[indexPath.row])
        print("tap")
    }
    
    
    
    
}
    


