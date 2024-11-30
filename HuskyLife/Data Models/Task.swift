//
//  Task.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import Foundation

struct Task {
    let name: String
    let date: Date
    let startTime: Date
    let endTime: Date

    var timeRange: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return "\(formatter.string(from: startTime))-\(formatter.string(from: endTime))"
    }
    
    static func createDummyTasks() -> [Task] {
        let calendar = Calendar.current
        let today = Date()
        
        // dummy
        return [
            Task(
                name: "CS5610 Web Development",
                date: calendar.startOfDay(for: today),
                startTime: calendar.date(bySettingHour: 11, minute: 0, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 12, minute: 30, second: 0, of: today)!
            ),
            Task(
                name: "CS5520 Mobile Development iOS",
                date: calendar.startOfDay(for: today),
                startTime: calendar.date(bySettingHour: 14, minute: 0, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 15, minute: 30, second: 0, of: today)!
            ),
            Task(
                name: "Finish CS5520 HW5 & Project",
                date: calendar.startOfDay(for: today),
                startTime: calendar.date(bySettingHour: 16, minute: 30, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 21, minute: 30, second: 0, of: today)!
            ),
            Task(
                name: "Finish CS5520 HW6 & Project12345",
                date: calendar.startOfDay(for: today),
                startTime: calendar.date(bySettingHour: 16, minute: 30, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 21, minute: 30, second: 0, of: today)!
            ),
            Task(
                name: "Finish CS5520 HW6 & Projewct12345",
                date: calendar.startOfDay(for: today),
                startTime: calendar.date(bySettingHour: 16, minute: 30, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 21, minute: 30, second: 0, of: today)!
            ),
            Task(
                name: "Team Meeting",
                date: calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: today))!,
                startTime: calendar.date(bySettingHour: 10, minute: 0, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 11, minute: 0, second: 0, of: today)!
            ),
            Task(
                name: "Previous Task",
                date: calendar.date(byAdding: .day, value: -1, to: calendar.startOfDay(for: today))!,
                startTime: calendar.date(bySettingHour: 15, minute: 0, second: 0, of: today)!,
                endTime: calendar.date(bySettingHour: 16, minute: 0, second: 0, of: today)!
            )
        ]
    }
}
