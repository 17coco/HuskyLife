//
//  InfoDetailsTableViewCell.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit

class InfoDetailsTableViewCell: UITableViewCell {
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
        
        selectionStyle = .none
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .systemBackground
        wrapperCellView.layer.cornerRadius = 12
        wrapperCellView.layer.shadowColor = UIColor.black.cgColor
        wrapperCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        wrapperCellView.layer.shadowRadius = 4
        wrapperCellView.layer.shadowOpacity = 0.1
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(wrapperCellView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = .systemFont(ofSize: 20, weight: .semibold)
        labelName.textColor = .label
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.font = .systemFont(ofSize: 15, weight: .medium)
        labelAddress.textColor = .secondaryLabel
        labelAddress.numberOfLines = 0
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelAddress)
    }
    
    func setupLabelDescription() {
        labelDescription = UILabel()
        labelDescription.font = .systemFont(ofSize: 14, weight: .regular)
        labelDescription.textColor = .tertiaryLabel
        labelDescription.numberOfLines = 0
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            wrapperCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            wrapperCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            
            labelAddress.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            labelAddress.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelAddress.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelDescription.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 8),
            labelDescription.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelDescription.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelDescription.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
