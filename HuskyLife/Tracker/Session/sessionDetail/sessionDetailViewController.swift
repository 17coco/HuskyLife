//
//  sessionDetailViewController.swift
//  HuskyLife
//
//  Created by Zihan Xu on 2024/12/3.
//

import UIKit

class sessionDetailViewController: UIViewController {
    let detailScreen = sessionDetail()
    var session:Session!
    
    override func loadView() {
        view = detailScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailScreen.labelName.text = "Theme: \(session.theme)"
        detailScreen.labelEmail.text = "Strat: \(session.start.formatted())"
        detailScreen.labelSchool.text = "End: \(session.end.formatted())"
        detailScreen.labelDob.text = "Duration: \(formatTimeInterval(session.end.timeIntervalSince(session.start)))"
        detailScreen.labelCountry.text = "Content: \(session.content)"
        

    }
    

}
