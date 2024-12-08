//
//  AddTrackerViewController.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/11/28.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddTrackerViewController: UIViewController {

    let addTrackerSheet = AddTrackerView()
    
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User!
    let childProgressView = ProgressSpinnerViewController()
     
     override func loadView() {
         view = addTrackerSheet
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTrackerSheet.addButton.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }

    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        let name = addTrackerSheet.nameTextField.text
        let initGoal = addTrackerSheet.initGoalTextField.text
        let timeNeeded = addTrackerSheet.timeNeededTextField.text
        
        if name == "" || initGoal == "" || timeNeeded == ""{
            //alert..
        }else{
            if let nameUw = name, let time = Int(timeNeeded!), let goal = initGoal {
                let tracker = Tracker(name: nameUw, timeNeeded: time, timeSpent: 0, lastSession: "NONE", currentGoal: goal)
                
                saveTrackerToFireStore(tracker: tracker)
            }
        }
        
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveTrackerToFireStore(tracker: Tracker){
        if let userEmail = currentUser!.email{
            let collectionTrackers = database
                .collection("users")
                .document(userEmail)
                .collection("trackers")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            do{
                try collectionTrackers.addDocument(from: tracker, completion: {(error) in
                    if error == nil{
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()
                        self.dismiss(animated: true)
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    
    }
}



//MARK: adopting progress indicator protocol...
extension AddTrackerViewController:ProgressSpinnerDelegate{
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
