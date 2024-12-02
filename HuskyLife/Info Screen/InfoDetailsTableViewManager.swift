//
//  InfoDetailsTableViewManager.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import Foundation
import UIKit

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
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //pass messagesList[indexPath.row].chatId to chatScreen
//        //jump tp chat screen
//        let selected = messagesList[indexPath.row]
//        let chatController = ChatViewController()
//        chatController.chatId = selected.chatId
//        chatController.currentUserEmail = currentUser?.email ?? ""
//        chatController.selfName = currentUser?.displayName ?? ""
//        chatController.theOtherUserName = selected.name
//        navigationController?.pushViewController(chatController, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
}

