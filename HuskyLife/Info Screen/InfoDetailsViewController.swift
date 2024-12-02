//
//  InfoDetailsViewController.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit
import Firebase

class InfoDetailsViewController: UIViewController {
    let infoDetailsView = InfoDetailsView()
    let database = Firestore.firestore()
    var mapDataList = [MapData]()
    var category = ""
    
    override func loadView() {
        view = infoDetailsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        infoDetailsView.tableViewInfoDetails.dataSource = self
        infoDetailsView.tableViewInfoDetails.delegate = self
        fetchDatabaseData()
        
        
    }
    private func fetchDatabaseData() {
        database.collection("mapData").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found.")
                return
            }
            
            self.mapDataList.removeAll() // Clear existing data
            
            // Iterate through documents and parse data
            for document in documents {
                let data = document.data()
                
                if self.category == data["category"] as? String {
                    
                    if let address = data["address"] as? String,
                       let description = data["description"] as? String,
                       let location = data["location"] as? GeoPoint,
                       let name = data["name"] as? String {
                        
                        // Create a MapData object
                        let mapData = MapData(
                            address: address,
                            category: self.category,
                            description: description,
                            location: location,
                            name: name
                        )
                        self.mapDataList.append(mapData) // Add to the list
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.infoDetailsView.tableViewInfoDetails.reloadData()
            }
            
            // Handle the fetched data
            //            self.handleDataUpdate()
        }
    }
    private func handleDataUpdate() {
        print("Fetched \(mapDataList.count) items:")
        for mapData in mapDataList {
            print("Name: \(mapData.name), Description: \(mapData.description), Address: \(mapData.address), Category: \(mapData.category)")
        }
        // Add code here to update the UI or pass data to other components
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
