//
//  TrackerSessionViewController.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TrackerSessionViewController: UIViewController {
    let sessionScreen = TrackerSessionView()
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User!
    var tracker:Tracker!
    var sessions = [Session]()
    
    override func loadView(){
        view = sessionScreen
    }
    
    override func viewWillAppear(_ animated:Bool){
        if let id = self.tracker.id {
            self.database.collection("users")
                .document((self.currentUser?.email)!)
                .collection("trackers").document(id).collection("sessions")
                .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                    if let documents = querySnapshot?.documents{
                        self.sessions.removeAll()
                        for document in documents{
                            do{
                                let session = try document.data(as: Session.self)
                                self.sessions.append(session)
                            }catch{
                                print(error)
                            }
                        }
                        self.sessions.sort(by: {$0.end < $1.end})
                        self.sessionScreen.trackerSessionsTableView.reloadData()
                        //print(self.sessions)
                    }
                })
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sessions"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onNewSessionButtonTapped)
        )
//        sessionScreen.buttonNewSession.addTarget(self, action: #selector(onNewSessionButtonTapped), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add, target: self, action: #selector(onNewSessionButtonTapped)
//        )
        //MARK: patching table view delegate and data source...
        sessionScreen.trackerSessionsTableView.delegate = self
        sessionScreen.trackerSessionsTableView.dataSource = self
        
        //MARK: removing the separator line...
        sessionScreen.trackerSessionsTableView.separatorStyle = .none
        
        self.sessionScreen.trackerSessionsTableView.reloadData()
    }
    
    func deleteSession(session:Session) {
        if let id = session.id, let trackerID = self.tracker.id{
            self.database.collection("users")
                .document((self.currentUser?.email)!)
                .collection("trackers")
                .document(trackerID)
                .collection("sessions")
                .document(id).delete()
        }
    }
    func openSessionDetail(session:Session) {
        let detailScreen = sessionDetailViewController()
        detailScreen.session = session
        navigationController?.pushViewController(detailScreen, animated: true)
    }
    
    @objc func onNewSessionButtonTapped(){
        let newSession = NewSessionViewController()
        newSession.currentUser = currentUser
        newSession.trackerTime = tracker.timeSpent
        if let trackerIDUw = tracker.id {
            newSession.trackerID = trackerIDUw
        }
        navigationController?.pushViewController(newSession, animated: true)
    }

}
