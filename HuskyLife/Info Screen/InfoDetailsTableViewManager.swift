//
//  InfoDetailsTableViewManager.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import Foundation
import UIKit
import MapKit

extension InfoDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.infoDetailsTableViewID, for: indexPath) as! InfoDetailsTableViewCell
        let mapData = mapDataList[indexPath.row]
        cell.labelName.text = mapData.name
        cell.labelAddress.text = mapData.address
        cell.labelDescription.text = mapData.description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //jump tp chat screen
        let selected = mapDataList[indexPath.row]
        
        let selectedPlace = Place(title: selected.name, coordinate: selected.coordinate, info: selected.description)
//        navigationController?.pushViewController(mapViewController, animated: true)
        NotificationCenter.default.post(name: .placeSelected, object: selectedPlace)

        let mapIndex = 2
        tabBarController?.selectedIndex = mapIndex
    }
}

