//
//  CalendarManager.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    get total in a month view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let (dayOffset, daysInMonth) = getDaysInMonth()
        let day = indexPath.item - dayOffset + 1
        if day > 0 && day <= daysInMonth {
            var components = calendar.dateComponents(
                [.year, .month], from: currentMonth
            )
            components.day = day
            
            if let newDate = calendar.date(from: components) {
                selectedDate = newDate
                updateTasksList()
                collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        let (dayOffset, daysInMonth) = getDaysInMonth()
        let day = indexPath.item - dayOffset + 1
        
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            dateLabel.widthAnchor.constraint(equalTo: cell.contentView.widthAnchor),
            dateLabel.heightAnchor.constraint(equalTo: cell.contentView.heightAnchor)
        ])
        dateLabel.textAlignment = .center
        cell.contentView.backgroundColor = .clear
        
        if indexPath.item < dayOffset {
            let prevRange = calendar.range(
                of: .day, in: .month, for: calendar.date(byAdding: .month, value: -1, to: currentMonth)!
            )!
            let prevDays = prevRange.count
            let prevDay = prevDays - (dayOffset - indexPath.item - 1)
            dateLabel.textColor = .systemGray3
            dateLabel.text = "\(prevDay)"
            
        } else if day > daysInMonth {
            let nextMonthDay = day - daysInMonth
            dateLabel.textColor = .systemGray3
            dateLabel.text = "\(nextMonthDay)"
            
        } else {
            dateLabel.textColor = .black
            dateLabel.text = "\(day)"
            
            var components = calendar.dateComponents(
                [.year, .month], from: currentMonth
            )
            components.day = day
            
            if let cellDate = calendar.date(from: components) {
                let selected = calendar.dateComponents(
                    [.year, .month, .day], from: selectedDate
                )
                let cellComponents = calendar.dateComponents(
                    [.year, .month, .day], from: cellDate
                )
                if selected.year == cellComponents.year && selected.month == cellComponents.month && selected.day == cellComponents.day {
                    dateLabel.textColor = .white
                    cell.contentView.backgroundColor = .systemBlue
//                    blue dot
                    cell.contentView.layer.cornerRadius = min(cell.frame.width, cell.frame.height) / 2
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(collectionView.frame.width / 7)
        return CGSize(width: width, height: width)
    }
}
