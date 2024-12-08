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
        cell.labelHours.text = "Time Elapsed: \((trackers[indexPath.row].timeSpent/60/60).formatted(.number.precision(.fractionLength(1)))) Hours"
        cell.labelGoal.text = "Goal: \(trackers[indexPath.row].currentGoal)"
        //cell.progressView.setProgress(0.75)
        let progress = Float(trackers[indexPath.row].timeSpent)/Float(trackers[indexPath.row].timeNeeded)
        let boundedProgress = max(0, min(progress, 1))
        var filler = ""
        var i = 0
        while i < Int(74*boundedProgress) {
            filler = filler.appending("|")
            i+=1
        }
        cell.progressView.progressLabel.text = String(format: "%.1f%%", boundedProgress * 100)
        cell.progressView.progressIndicator.text = "\(filler)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startSessionView(tracker: self.trackers[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let editAction = UIAction(title: "Detail", image: UIImage(systemName: "pencil")) { _ in
                print("Detail tapped")
                self.startSessionView(tracker: self.trackers[indexPath.row])
            }
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                print("Delete tapped")
                self.deleteTracker(tracker: self.trackers[indexPath.row])
            }
            return UIMenu(title: "Options", children: [editAction, deleteAction])
        }
        return config
    }
    
    
}
    


