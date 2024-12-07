//
//  ProgressSpinnerViewController.swift
//  HuskyLife
//
//  Created by Beihan Zhou on 11/25/24.
//

import UIKit

class ProgressSpinnerViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView!
    var isOpaque: Bool = false // Control whether the spinner is transparent or opaque

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()

        // Set background based on `isOpaque`
        if isOpaque {
            view.backgroundColor = UIColor.white // Opaque
        } else {
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25) // Transparent
        }
        
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
