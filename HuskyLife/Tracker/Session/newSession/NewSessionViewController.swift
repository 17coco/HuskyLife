//
//  NewSessionViewController.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/2.
//


//To start a session:
//1. entering info: Theme (of the session)
//2.1.1 start an ongoing session to record
//2.1.2 end the session
//or 2.2. enter the start/end time
//3. enter content (what did you do)

import UIKit
import FirebaseFirestore
import FirebaseAuth


class NewSessionViewController: UIViewController {

    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User!
    
    let newSessionInit = NewSessionView()
    let enterTime = EnterTimeScreen()
    let enterContent = EnterContentScreen()
    let onGoingSession = OnGoingSession()
    
    var trackerID:String!
    var trackerTime:Int!
    var theme:String = ""
    var startTime:Date!
    var endTime:Date!
    
    //timer variables
    var timer:Timer?
    var elapsedTime:TimeInterval = 0
    var localStartTime:Date!
    var isTimerRunning = false
    
    let childProgressView = ProgressSpinnerViewController()
    
    
    override func loadView(){
        view = newSessionInit
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //first page
        newSessionInit.enterTimeButton.addTarget(self, action: #selector(onButtonEnterTimeTapped), for: .touchUpInside)
        newSessionInit.liveTrackButton.addTarget(self, action: #selector(onButtonLiveTrackTapped), for: .touchUpInside)
        //second page 1
        enterTime.timeProceedButton.addTarget(self, action: #selector(onButtonTimeProceedTapped), for: .touchUpInside)
        //second page 2
        onGoingSession.finishTimerButton.addTarget(self, action: #selector(onButtonStopTimerTapped), for: .touchUpInside)
        onGoingSession.pauseButton.addTarget(self, action: #selector(toggleTimer), for: .touchUpInside)
        //third page
        enterContent.contentFinishButton.addTarget(self, action: #selector(onButtonFinishTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLiveTrackTapped(){
        if let themeNew = newSessionInit.themeTextField.text {
            if !themeNew.isEmpty {
                theme = themeNew
                onGoingSession.themeLabel.text = themeNew
                startTime = Date()
                localStartTime = startTime
                view = onGoingSession
                startTimer()
                        
            }
        }
    }
    
    @objc func onButtonEnterTimeTapped(){
        if let themeNew = newSessionInit.themeTextField.text {
            if !themeNew.isEmpty {
                theme = themeNew
                view = enterTime
            }
        }
    }
    
    @objc func onButtonTimeProceedTapped(){
        startTime = enterTime.datePickerStart.date
        endTime = enterTime.datePickerEnd.date
        view = enterContent
    }
    
    @objc func onButtonStopTimerTapped() {
        timer?.invalidate()
        endTime = Date()
        view = enterContent
    }
    
    @objc func onButtonFinishTapped(){

        if let contentUw = enterContent.contentTextView.text {
            let session = Session(theme: theme, start: startTime, end: endTime, content: contentUw)
            
            saveSessionToFireStore(session:session)
            updateTracker(elapsedTime: endTime.timeIntervalSince(startTime))
        }
        
    }

    @objc private func toggleTimer() {
        if isTimerRunning {
            pauseTimer()
        } else {
            startTimer()
        }
    }
    
    @objc private func updateElapsedTime() {
        // Calculate total elapsed time (paused time + current interval)
        let currentElapsedTime = elapsedTime + (localStartTime != nil ? Date().timeIntervalSince(localStartTime!) : 0)
        onGoingSession.timerLabel.text = "\(formatTimeInterval(currentElapsedTime))"
    }
    
    func startTimer() {
        if isTimerRunning { return } // Prevent multiple timers from starting
        
        localStartTime = Date() // Start the timer from the current time
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
        isTimerRunning = true
        onGoingSession.pauseButton.setTitle("Pause", for: .normal)
    }
    
    func pauseTimer() {
        guard isTimerRunning else { return } // No timer to pause
        
        // Calculate and save elapsed time before pausing
        if let start = localStartTime {
            elapsedTime += Date().timeIntervalSince(start)
        }
        timer?.invalidate() // Stop the timer
        isTimerRunning = false
        onGoingSession.pauseButton.setTitle("Resume", for: .normal)
    }
    
    func updateTracker(elapsedTime: TimeInterval) {
        
        
        if let userEmail = currentUser!.email, let time = trackerTime{
            let newHours = time + Int(elapsedTime)
            database
                .collection("users")
                .document(userEmail)
                .collection("trackers")
                .document(trackerID).setData(["timeSpent": newHours], mergeFields: ["timeSpent"])
        }
    }
    //MARK: logic to add a contact to Firestore...
    func saveSessionToFireStore(session: Session){
        if let userEmail = currentUser!.email{
            let collectionSessions = database
                .collection("users")
                .document(userEmail)
                .collection("trackers")
                .document(trackerID)
                .collection("sessions")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            do{
                try collectionSessions.addDocument(from: session, completion: {(error) in
                    if error == nil{
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()
                        self.navigationController?.popViewController(animated: true)
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    
    }
}



//MARK: adopting progress indicator protocol...
extension NewSessionViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

