//
//  InfoDetailsTableViewCell.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit

class InfoDetailsTableViewCell: UITableViewCell {
    
    // UI components
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelAddress: UILabel!
    var labelDescription: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelName()
        setupLabelAddress()
        setupLabelDescription()
        initConstraints()
    }
    
    // Setup wrapper view
    private func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 8
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.borderColor = UIColor.lightGray.cgColor
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(wrapperCellView)
    }
    
    // Setup name label
    private func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = .black
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    // Setup address label
    private func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.font = UIFont.systemFont(ofSize: 14)
        labelAddress.textColor = .darkGray
        labelAddress.numberOfLines = 0
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelAddress)
    }
    
    // Setup description label
    private func setupLabelDescription() {
        labelDescription = UILabel()
        labelDescription.font = UIFont.italicSystemFont(ofSize: 14)
        labelDescription.textColor = .gray
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    
    // Setup constraints
    private func initConstraints() {
        NSLayoutConstraint.activate([
            // Wrapper cell view constraints
            wrapperCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // Name label constraints
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            
            // Address label constraints
            labelAddress.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelAddress.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelAddress.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            
            // Description label constraints
            labelDescription.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelDescription.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelDescription.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelDescription.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
