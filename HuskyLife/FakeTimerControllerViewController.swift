//
//  FakeTimerControllerViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit

class FakeTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let labelTimer = UILabel()
        labelTimer.text = "This is a fake timer"
        labelTimer.translatesAutoresizingMaskIntoConstraints = false 
        view.addSubview(labelTimer)
        NSLayoutConstraint.activate([
            labelTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTimer.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

}
