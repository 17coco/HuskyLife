//
//  TrackerHelpers.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//
import Foundation

func formatTimeInterval(_ interval: TimeInterval) -> String {
        let hours = Int(interval) / 3600
        let minutes = (Int(interval) % 3600) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}
