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
        cell.labelHours.text = "Duration: \(formatTimeInterval((sessions[indexPath.row].end.timeIntervalSince(sessions[indexPath.row].start))))"
        cell.labelGoal.text = "Started: \(sessions[indexPath.row].start.formatted(.dateTime))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openSessionDetail(session: sessions[indexPath.row])
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let editAction = UIAction(title: "Detail", image: UIImage(systemName: "pencil")) { _ in
                print("Detail tapped")
                self.openSessionDetail(session: self.sessions[indexPath.row])
            }
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                print("Delete tapped")
                self.deleteSession(session: self.sessions[indexPath.row])
            }
            return UIMenu(title: "Options", children: [editAction, deleteAction])
        }
        return config
    }
}

