//
//  TaskAddProgress.swift
//  HuskyLife
//
//  Created by Xuyang Wang on 12/1/24.
//

import Foundation

extension ModalContainerController:ProgressSpinnerDelegate{
    func showActivityIndicator() {
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator() {
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
