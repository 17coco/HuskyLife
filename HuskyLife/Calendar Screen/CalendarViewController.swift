//
//  CalendarViewController.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit

class CalendarViewController: UIViewController {
    let calendarView = CalendarView()
    var selectedDate: Date
    var currentMonth: Date
    var tasks: [Task]
    var displayedTasks: [Task] = []
    let calendar = Calendar.current
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
    init() {
        self.selectedDate = Date()
        self.currentMonth = Date()
        //       wxy: Dont forget to add there
        self.tasks = Task.createDummyTasks()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = calendarView
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = false
        super.viewDidLoad()
        calendarView.calendarGrid.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "dateCell")
        let currentDate = Date()
        selectedDate = currentDate
        currentMonth = currentDate
        calendarView.tasksTableView.delegate = self
        calendarView.tasksTableView.dataSource = self
        calendarView.calendarGrid.delegate = self
        calendarView.calendarGrid.dataSource = self
        calendarView.prevButton.addTarget(self, action: #selector(previousMonth), for: .touchUpInside)
        calendarView.nextButton.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        
        updateCalendar()
        updateTasksList()
        NotificationCenter.default.addObserver(self, selector: #selector(monthTapped), name: NSNotification.Name("MonthLabelTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(yearTapped), name: NSNotification.Name("YearLabelTapped"), object: nil)
    }
    
    @objc func previousMonth() {
        currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth)!
        updateCalendar()
    }
    
    @objc func nextMonth() {
        currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth)!
        updateCalendar()
    }
    
    func updateCalendar() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        calendarView.monthLabel.text = dateFormatter.string(from: currentMonth).uppercased()
        calendarView.yearLabel.text = String(Calendar.current.component(.year, from: currentMonth))
        calendarView.calendarGrid.reloadData()
    }
    
    func updateTasksList() {
        let taskDate = tasks.filter {
            calendar.isDate($0.date, inSameDayAs: selectedDate)
        }
        displayedTasks = taskDate.sorted {
            $0.startTime < $1.startTime
        }
        calendarView.tasksTableView.reloadData()
    }
    
    @objc func monthTapped() {
        let dateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols ?? []
        let alert = UIAlertController(title: "Select Month", message: nil, preferredStyle: .actionSheet)
        
        for (index, month) in months.enumerated() {
            alert.addAction(UIAlertAction(title: month, style: .default) { _ in
                var components = self.calendar.dateComponents([.year, .month], from: self.currentMonth)
                components.month = index + 1
                if let newDate = self.calendar.date(from: components) {
                    self.currentMonth = newDate
                    self.updateCalendar()
                }
            })
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func yearTapped() {
        let alert = UIAlertController(title: "Enter a Year", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.text = String(self.calendar.component(.year, from: self.currentMonth))
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            if let yearText = alert.textFields?.first?.text,
               let year = Int(yearText) {
                var components = self.calendar.dateComponents([.year, .month], from: self.currentMonth)
                components.year = year

                if let newDate = self.calendar.date(from: components) {
                    self.currentMonth = newDate
                    self.updateCalendar()
                }
            }
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    func getDaysInMonth() -> (dayOffset: Int, daysInMonth: Int) {
        let firstDayOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: currentMonth)
        )!
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        let dayOffset = (firstWeekday + 5) % 7
        let range = calendar.range(of: .day, in: .month, for: currentMonth)!
        let daysInMonth = range.count
        
        return (dayOffset, daysInMonth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
