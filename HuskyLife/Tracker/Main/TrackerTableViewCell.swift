//
//  TrackerTableViewCell.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit

class TrackerTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelHours: UILabel!
    var labelGoal: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelHours()
        setupLabelGoal()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelHours(){
        labelHours = UILabel()
        labelHours.font = UIFont.boldSystemFont(ofSize: 14)
        labelHours.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelHours)
    }
    
    func setupLabelGoal(){
        labelGoal = UILabel()
        labelGoal.font = UIFont.boldSystemFont(ofSize: 14)
        labelGoal.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelGoal)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelHours.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelHours.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelHours.heightAnchor.constraint(equalToConstant: 16),
            labelHours.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelGoal.topAnchor.constraint(equalTo: labelHours.bottomAnchor, constant: 2),
            labelGoal.leadingAnchor.constraint(equalTo: labelHours.leadingAnchor),
            labelGoal.heightAnchor.constraint(equalToConstant: 16),
            labelGoal.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
