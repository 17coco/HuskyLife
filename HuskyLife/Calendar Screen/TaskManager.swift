//
//  TaskManager.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        let task = displayedTasks[indexPath.row]
        let currentTime = Date()
        let timeDifference = task.startTime.timeIntervalSince(currentTime) / 3600
        var textColor: UIColor = .gray
        
        if timeDifference < 0 {
            textColor = .gray
        } else if timeDifference <= 5 {
            textColor = .red
        } else if timeDifference <= 24 {
            textColor = .systemOrange
        } else {
            textColor = .systemGreen
        }
        cell.labelTaskName.text = task.name
        cell.labelTime.text = task.timeRange
        cell.labelTime.textColor = textColor
        let sfSymbol = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysTemplate)
        cell.imageViewSymbol.image = sfSymbol
        cell.imageViewSymbol.tintColor = textColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
