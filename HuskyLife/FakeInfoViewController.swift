//
//  FakeInfoViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit

class FakeInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        view.backgroundColor = .white

        let labelInfo = UILabel()
        labelInfo.text = "This is fake Info"
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelInfo)
        NSLayoutConstraint.activate([
            labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    

}
