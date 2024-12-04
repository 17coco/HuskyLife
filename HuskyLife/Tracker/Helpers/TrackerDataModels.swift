//
//  TrackerDataModels.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import Foundation
import FirebaseFirestore

struct Tracker:Codable{
    @DocumentID var id: String?
    var name:String
    var timeNeeded:Int
    var timeSpent:Int
    var lastSession:String
    var currentGoal:String
    
    init(name:String, timeNeeded: Int, timeSpent: Int, lastSession: String, currentGoal: String) {
        self.name = name
        self.timeNeeded = timeNeeded
        self.timeSpent = timeSpent
        self.lastSession = lastSession
        self.currentGoal = currentGoal
    }
}

struct Session:Codable{
    @DocumentID var id: String?
    var theme:String
    var start:Date
    var end:Date
    var content:String
    
    init(theme: String, start: Date, end: Date, content: String) {
        self.theme = theme
        self.start = start
        self.end = end
        self.content = content
    }
}
