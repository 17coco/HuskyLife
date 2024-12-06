//
//  FakeMapViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit

class FakeMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let labelMap = UILabel()
        labelMap.text = "This is a fake Map"
        labelMap.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMap)
        NSLayoutConstraint.activate([
            labelMap.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMap.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
