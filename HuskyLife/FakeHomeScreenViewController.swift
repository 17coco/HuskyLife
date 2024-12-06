//
//  FakeHomeScreenViewController.swift
//  HuskyLife
//
//  Created by Beihan Zhou  on 11/25/24.
//

import UIKit

class FakeHomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let labelCalendar = UILabel()
        labelCalendar.text = "This is a fake calendar"
        labelCalendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelCalendar)
        NSLayoutConstraint.activate([
            labelCalendar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCalendar.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
