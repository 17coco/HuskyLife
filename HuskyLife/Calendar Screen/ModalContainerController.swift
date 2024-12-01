//
//  ModalContainerController.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 11/30/24.
//
import UIKit
import Firebase
import FirebaseAuth
import Foundation

class ModalContainerController: UIViewController {
    var taskView: AddTaskView = AddTaskView()
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    let childProgressView = ProgressSpinnerViewController()
    override func loadView() {
        view = taskView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskView.saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        taskView.dismissButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissModal() {
        dismiss(animated: true)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showSuccessAndDismiss() {
        let alert = UIAlertController(title: "Success", message: "Task added successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        })
        present(alert, animated: true)
    }
    
    @objc func saveTask() {
        if !validateFields() {
            showAlert(title: "Missing Info", message: "Please fill in all fields!")
            return
        }
        let selectedDate = taskView.datePicker.date
        let startTime = getFullDateTime(from: selectedDate, with: taskView.startTimePicker.date)
        let endTime = getFullDateTime(from: selectedDate, with: taskView.endTimePicker.date)
        if !(endTime > startTime) {
            showAlert(title: "Invalid End Time", message: "End time must be after start time.")
            return
        }
        addTask(
            name: taskView.taskNameField.text ?? "",
            date: selectedDate,
            startTime: startTime,
            endTime: endTime
        )
//        dismiss(animated: true)
    }
    
    func getFullDateTime(from date: Date, with time: Date) -> Date {
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute], from: time)
        return calendar.date(bySettingHour: timeComponents.hour ?? 0,
                           minute: timeComponents.minute ?? 0,
                           second: 0,
                           of: date) ?? date
    }
    
    func addTask(name: String, date: Date, startTime: Date, endTime: Date) {
        showActivityIndicator()
         let newTask: [String: Any] = [
             "name": name,
             "date": Timestamp(date: date),
             "startTime": Timestamp(date: startTime),
             "endTime": Timestamp(date: endTime)
         ]
         let userEmail = currentUser?.email?.lowercased() ?? ""
         database.collection("users")
             .document(userEmail)
             .collection("tasks")
             .addDocument(data: newTask){ error in
                 self.hideActivityIndicator()
                 
                 if let error = error {
                     self.showAlert(title: "Error", message: "Failed to save task: \(error.localizedDescription)")
                 } else {
                     self.showSuccessAndDismiss()
                 }
             }
     }
    func validateFields() -> Bool {
        let taskName = taskView.taskNameField.text ?? ""
        let date = taskView.dateField.text ?? ""
        let startTime = taskView.startTimeField.text ?? ""
        let endTime = taskView.endTimeField.text ?? ""
        return !taskName.isEmpty && !date.isEmpty && !startTime.isEmpty && !endTime.isEmpty
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
