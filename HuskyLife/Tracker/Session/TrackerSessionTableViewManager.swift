//
//  TrackerSessionTableViewManager.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

extension TrackerSessionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.sessionTableViewID, for: indexPath) as! TrackerSessionTableViewCell
        cell.labelName.text = sessions[indexPath.row].theme
        cell.labelHours.text = "Duration:\(formatTimeInterval((sessions[indexPath.row].end.timeIntervalSince(sessions[indexPath.row].start))))"
        cell.labelGoal.text = "Started: \(sessions[indexPath.row].start)"
//                cell.labelName.text = "1"
//                cell.labelHours.text = "2"
//                cell.labelGoal.text = "3"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //startSessionView(tracker: self.sessions[indexPath.row])
        print(self.sessions[indexPath.row])

    }
}

