//
//  TrackerMainViewController.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TrackerMainViewController: UIViewController {
    
    let trackerMainScreen:TrackerView = TrackerView()
    
    //data
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User!
    var trackers = [Tracker]()

    override func loadView() {
        view = trackerMainScreen
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Task Tracker"
        
        self.database.collection("users")
            .document((self.currentUser?.email)!)
            .collection("trackers")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.trackers.removeAll()
                    for document in documents{
                        do{
                            let tracker = try document.data(as: Tracker.self)
                            self.trackers.append(tracker)
                        }catch{
                            print(error)
                        }
                    }
                    self.trackers.sort(by: {$0.lastSession < $1.lastSession})
                    self.trackerMainScreen.trackersTableView.reloadData()
                    print(self.trackers)
                }
            })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onAddButtonTapped)
        )
        //MARK: patching table view delegate and data source...
        trackerMainScreen.trackersTableView.delegate = self
        trackerMainScreen.trackersTableView.dataSource = self
        
        //MARK: removing the separator line...
        trackerMainScreen.trackersTableView.separatorStyle = .none
        
        self.trackerMainScreen.trackersTableView.reloadData()
    }
    @objc func onAddButtonTapped() {
        let addSheet = AddTrackerViewController()
        addSheet.currentUser = currentUser
        let searchSheetNavController = UINavigationController(rootViewController: addSheet)
        
        // MARK: setting up modal style...
        searchSheetNavController.modalPresentationStyle = .pageSheet
        
        if let bottomSheet = searchSheetNavController.sheetPresentationController{
            bottomSheet.detents = [.medium(), .large()]
            bottomSheet.prefersGrabberVisible = true
        }
        
        
        
        //addSheet.navigationController?.modalPresentationStyle = .pageSheet
        present(searchSheetNavController, animated: true)
    }
    func startSessionView(tracker: Tracker){
        let sessionController = TrackerSessionViewController()
        sessionController.tracker = tracker
        sessionController.currentUser = currentUser
        navigationController?.pushViewController(sessionController, animated: true)
    }

}
