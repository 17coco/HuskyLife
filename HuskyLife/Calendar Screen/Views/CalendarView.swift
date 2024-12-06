//
//  CalendarView.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit

class CalendarView: UIView {
    var scrollView: UIScrollView!
    var contentWrapper: UIView!
    var calendarHeader: UIView!
    var monthYearView: UIStackView!
    var monthLabel: UILabel!
    var yearLabel: UILabel!
    var prevButton: UIButton!
    var nextButton: UIButton!
    var weekDaysView: UIStackView!
    var calendarGrid: UICollectionView!
    var tasksTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupScrollView()
        setupCalendarHeader()
        setupweekDaysView()
        setupCalendarGrid()
        setupTasksTableView()
        initConstraints()
    }
    func setupScrollView() {
        scrollView = UIScrollView()
        //        scrollView.delaysContentTouches = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper = UIView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(contentWrapper)
    }
    
    func setupCalendarHeader() {
        
        calendarHeader = UIView()
        calendarHeader.translatesAutoresizingMaskIntoConstraints = false
        
        prevButton = UIButton(type: .system)
        prevButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        prevButton.tintColor = .black
        prevButton.layer.borderWidth = 1
        prevButton.layer.borderColor = UIColor.black.cgColor
        prevButton.layer.cornerRadius = 4
        prevButton.layer.cornerRadius = 20
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = UIButton(type: .system)
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextButton.tintColor = .black
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 4
        nextButton.layer.cornerRadius = 20
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        monthYearView = UIStackView()
        monthYearView.axis = .horizontal
        monthYearView.spacing = 4
        monthYearView.distribution = .fillEqually
        monthYearView.translatesAutoresizingMaskIntoConstraints = false
        
        monthLabel = UILabel()
        monthLabel.text = "Nov"
        monthLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        monthLabel.backgroundColor = .systemGray6
        monthLabel.textAlignment = .center
        monthLabel.clipsToBounds = true
        monthLabel.layer.borderWidth = 1
        monthLabel.layer.borderColor = UIColor.black.cgColor
        monthLabel.layer.cornerRadius = 5
        monthLabel.layoutMargins = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        
        yearLabel = UILabel()
        yearLabel.text = "2024"
        yearLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        yearLabel.backgroundColor = .systemGray6
        yearLabel.textAlignment = .center
        yearLabel.layer.borderWidth = 1
        yearLabel.layer.borderColor = UIColor.black.cgColor
        yearLabel.layer.cornerRadius = 5
        yearLabel.clipsToBounds = true
        
        yearLabel.layoutMargins = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        
        monthYearView.addArrangedSubview(monthLabel)
        monthYearView.addArrangedSubview(yearLabel)
        
        calendarHeader.addSubview(prevButton)
        calendarHeader.addSubview(monthYearView)
        calendarHeader.addSubview(nextButton)
        
        monthLabel.isUserInteractionEnabled = true
        yearLabel.isUserInteractionEnabled = true
        
        let monthTap = UITapGestureRecognizer(target: self, action: #selector(monthTapped))
        let yearTap = UITapGestureRecognizer(target: self, action: #selector(yearTapped))
        
        monthLabel.addGestureRecognizer(monthTap)
        yearLabel.addGestureRecognizer(yearTap)
        contentWrapper.addSubview(calendarHeader)
    }
    @objc private func monthTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("MonthLabelTapped"), object: nil)
    }
    
    @objc private func yearTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("YearLabelTapped"), object: nil)
    }
    
    func setupweekDaysView() {
        weekDaysView = UIStackView()
        weekDaysView.axis = .horizontal
        weekDaysView.distribution = .fillEqually
        weekDaysView.spacing = 0
        weekDaysView.translatesAutoresizingMaskIntoConstraints = false
        
        let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        for day in weekdays {
            let dayWrapper = UIView()
            dayWrapper.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.text = day
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            dayWrapper.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: dayWrapper.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: dayWrapper.centerYAnchor),
                label.widthAnchor.constraint(equalTo: dayWrapper.widthAnchor)
            ])
            
            weekDaysView.addArrangedSubview(dayWrapper)
        }
        contentWrapper.addSubview(weekDaysView)
    }
    
    func setupCalendarGrid() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        calendarGrid = UICollectionView(frame: .zero, collectionViewLayout: layout)
        calendarGrid.backgroundColor = .clear
        calendarGrid.isScrollEnabled = false
        calendarGrid.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(calendarGrid)
    }
    
    func setupTasksTableView() {
        tasksTableView = UITableView()
        tasksTableView.backgroundColor = .clear
        tasksTableView.separatorStyle = .none
        tasksTableView.showsVerticalScrollIndicator = false
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskCell")
        tasksTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        //        tasksTableView.isScrollEnabled = false
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(tasksTableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentWrapper.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.widthAnchor),
            contentWrapper.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            calendarHeader.topAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.topAnchor, constant: 16),
            calendarHeader.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 18),
            calendarHeader.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -18),
            calendarHeader.heightAnchor.constraint(equalToConstant: 40),
            
            prevButton.leadingAnchor.constraint(equalTo: calendarHeader.leadingAnchor),
            prevButton.centerYAnchor.constraint(equalTo: calendarHeader.centerYAnchor),
            prevButton.widthAnchor.constraint(equalToConstant: 40),
            prevButton.heightAnchor.constraint(equalToConstant: 40),
            
            monthYearView.centerXAnchor.constraint(equalTo: calendarHeader.centerXAnchor),
            monthYearView.centerYAnchor.constraint(equalTo: calendarHeader.centerYAnchor),
            monthYearView.heightAnchor.constraint(equalToConstant: 40),
            monthLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            yearLabel.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 4),
            yearLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            nextButton.trailingAnchor.constraint(equalTo: calendarHeader.trailingAnchor),
            nextButton.centerYAnchor.constraint(equalTo: calendarHeader.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 40),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            weekDaysView.topAnchor.constraint(equalTo: calendarHeader.bottomAnchor, constant: 16),
            weekDaysView.leadingAnchor.constraint(equalTo: calendarGrid.leadingAnchor),
            weekDaysView.trailingAnchor.constraint(equalTo: calendarGrid.trailingAnchor),
            weekDaysView.heightAnchor.constraint(equalToConstant: 20),
            
            calendarGrid.topAnchor.constraint(equalTo: weekDaysView.bottomAnchor, constant: 8),
            calendarGrid.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            calendarGrid.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -16),
            calendarGrid.heightAnchor.constraint(equalTo: calendarGrid.widthAnchor, multiplier: 6/7),
            
            tasksTableView.topAnchor.constraint(equalTo: calendarGrid.bottomAnchor, constant: 4),
            tasksTableView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -4),
            tasksTableView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if let layout = calendarGrid.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.invalidateLayout()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
