//
//  CalendarViewController.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/29/24.
//

import UIKit
import Firebase
import FirebaseAuth

class CalendarViewController: UIViewController {
    let calendarView = CalendarView()
    var selectedDate: Date
    var currentMonth: Date
    var tasks: [Task]
    var displayedTasks: [Task] = []
    let database = Firestore.firestore()
    let calendar = Calendar.current
    var currentUser:FirebaseAuth.User?
    var addButton: UIButton!
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    override func loadView() {
        view = calendarView
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.selectedDate = Date()
        self.currentMonth = Date()
        self.tasks = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
        loadTasks()
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        let modalContain = ModalContainerController()
        modalContain.currentUser = currentUser
        modalContain.modalPresentationStyle = .pageSheet
        if let sheet = modalContain.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(modalContain, animated: true)
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
        let currentTime = Date()
        let taskDate = tasks.filter {
            calendar.isDate($0.date, inSameDayAs: selectedDate)
        }
        
        displayedTasks = taskDate.sorted {
            let timeDifference1 = $0.startTime.timeIntervalSince(currentTime)
            let timeDifference2 = $1.startTime.timeIntervalSince(currentTime)
            if timeDifference1 >= 0 && timeDifference2 >= 0 {
                return timeDifference1 < timeDifference2
            } else if timeDifference1 < 0 && timeDifference2 < 0 {
                return timeDifference1 > timeDifference2
            } else {
                return timeDifference1 >= 0
            }
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

