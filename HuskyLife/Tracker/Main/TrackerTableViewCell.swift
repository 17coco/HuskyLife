//
//  TrackerTableViewCell.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class TrackerTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var progressView: Progress!
    var labelName: UILabel!
    var labelHours: UILabel!
    var labelGoal: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelHours()
        setupLabelGoal()
        setupProgressView()
        initConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .secondarySystemBackground
        wrapperCellView.layer.cornerRadius = 12.0
        wrapperCellView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        wrapperCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.2
        wrapperCellView.layer.masksToBounds = false
        wrapperCellView.layer.borderWidth = 0.5
        wrapperCellView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupProgressView() {
        progressView = Progress()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progressView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.preferredFont(forTextStyle: .headline)
        labelName.textColor = .label
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelHours() {
        labelHours = UILabel()
        labelHours.font = UIFont.preferredFont(forTextStyle: .subheadline)
        labelHours.textColor = .secondaryLabel
        labelHours.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelHours)
    }
    
    func setupLabelGoal() {
        labelGoal = UILabel()
        labelGoal.font = UIFont.preferredFont(forTextStyle: .footnote)
        labelGoal.textColor = .tertiaryLabel
        labelGoal.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelGoal)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 24),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor, constant: -32),
            
            progressView.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12),
            progressView.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
            progressView.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 16),
            progressView.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor, constant: -32),
            
            labelHours.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 12),
            labelHours.leadingAnchor.constraint(equalTo: progressView.leadingAnchor),
            labelHours.heightAnchor.constraint(equalToConstant: 16),
            labelHours.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor, constant: -32),
            
            labelGoal.topAnchor.constraint(equalTo: labelHours.bottomAnchor, constant: 8),
            labelGoal.leadingAnchor.constraint(equalTo: labelHours.leadingAnchor),
            labelGoal.heightAnchor.constraint(equalToConstant: 16),
            labelGoal.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
}
