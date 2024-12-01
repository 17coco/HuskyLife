//
//  Task.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import Foundation
import FirebaseFirestore

struct Task {
    let id: String
    let name: String
    let date: Date
    let startTime: Date
    let endTime: Date
    
    var timeRange: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return "\(formatter.string(from: startTime)) - \(formatter.string(from: endTime))"
    }
    
    init(id: String, name: String, date: Date, startTime: Date, endTime: Date) {
        self.id = id
        self.name = name
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
    }
}
