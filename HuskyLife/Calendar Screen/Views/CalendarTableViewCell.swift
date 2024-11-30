//
//  CalendarTableViewCell.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelTaskName: UILabel!
    var labelTime: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupWrapperCellView()
        setupLabelTaskName()
        setupLabelTime()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 10.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.3
        wrapperCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        wrapperCellView.layer.masksToBounds = false
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelTaskName() {
        labelTaskName = UILabel()
        labelTaskName.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTaskName.textColor = .black
        labelTaskName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTaskName)
    }
    func setupLabelTime() {
        labelTime = UILabel()
        labelTime.font = .systemFont(ofSize: 15)
        labelTime.textColor = .systemRed
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTime)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            labelTime.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelTime.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            
            labelTaskName.topAnchor.constraint(equalTo: labelTime.bottomAnchor, constant: 2),
            labelTaskName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelTaskName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelTaskName.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -12)
        ])
    }
}

