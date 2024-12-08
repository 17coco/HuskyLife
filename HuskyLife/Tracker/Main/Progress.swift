//
//  Progress.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/4.
//

import UIKit

class Progress: UIView {
    // MARK: - Properties
    let progressBackgroundView = UIView()
    let progressView = UIView()
    let progressLabel = UILabel()
    let progressIndicator = UILabel()
    
    // Progress tracking
    var progress: Float = 0 {
        didSet {
            updateProgress()
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup Methods
    private func setupViews() {
        // Configure background view
        progressBackgroundView.backgroundColor = .lightGray
        progressBackgroundView.layer.cornerRadius = 1
        addSubview(progressBackgroundView)
        
        // Configure progress view
        progressView.backgroundColor = .systemBlue
        progressView.layer.cornerRadius = 1
        addSubview(progressView)
        
        // Configure labels
        progressLabel.textAlignment = .center
        progressLabel.font = .systemFont(ofSize: 14, weight: .medium)
        progressLabel.textColor = .black
        addSubview(progressLabel)
        
        progressIndicator.textAlignment = .left
        progressIndicator.font = .systemFont(ofSize: 13.5, weight: .medium)
        progressIndicator.textColor = .blue
        addSubview(progressIndicator)
        
        // Set up constraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        progressBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Background view constraints
            progressBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            progressBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            progressBackgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            progressBackgroundView.heightAnchor.constraint(equalToConstant: 13),
            
            // Progress view constraints (width will be dynamic)
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 13),
            
            // Label constraints
            progressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            progressIndicator.leadingAnchor.constraint(equalTo: progressBackgroundView.leadingAnchor),
            progressIndicator.bottomAnchor.constraint(equalTo: progressBackgroundView.bottomAnchor),
        ])
    }
    
    // MARK: - Progress Update Method
    private func updateProgress() {
        // Ensure progress is between 0 and 1
        
        // Animate progress changes
        //        UIView.animate(withDuration: 0.3) {
        //            // Update progress view width constraint
        //            self.progressView.frame.size.width = progressViewWidth
        //            
        //            // Update label text
        //            self.progressLabel.text = String(format: "%.1f%%", boundedProgress * 100)
        //        }
    }
    
    // MARK: - Public Method to Set Progress
    func setProgress(_ progress: Float, animated: Bool = true) {
        self.progress = progress
    }
}
