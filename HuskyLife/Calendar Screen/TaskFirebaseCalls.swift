//
//  TaskFirebaseCalls.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/30/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension CalendarViewController {
    func loadTasks() {
        self.database.collection("users")
            .document(self.currentUser?.email?.lowercased() ?? "")
            .collection("tasks")
            .addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.tasks.removeAll()
                    for document in documents {
                        let data = document.data()
                        if let name = data["name"] as? String,
                           let dateTimestamp = data["date"] as? Timestamp,
                           let startTimestamp = data["startTime"] as? Timestamp,
                           let endTimestamp = data["endTime"] as? Timestamp {
                            
                            let task = Task(
                                id: document.documentID,
                                name: name,
                                date: dateTimestamp.dateValue(),
                                startTime: startTimestamp.dateValue(),
                                endTime: endTimestamp.dateValue()
                            )
                            self.tasks.append(task)
                        }
                    }
                    self.tasks.sort { $0.startTime < $1.startTime }
                    self.updateTasksList()
                    self.calendarView.tasksTableView.reloadData()
                }
            })
    }
    
    func addTask(name: String, date: Date, startTime: Date, endTime: Date) {
        let newTask: [String: Any] = [
            "name": name,
            "date": Timestamp(date: date),
            "startTime": Timestamp(date: startTime),
            "endTime": Timestamp(date: endTime)
        ]
        
        self.database.collection("users")
            .document(self.currentUser?.email?.lowercased() ?? "")
            .collection("tasks")
            .addDocument(data: newTask)
    }
}
