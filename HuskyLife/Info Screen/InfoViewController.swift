//
//  InfoViewController.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import UIKit

class InfoViewController: UIViewController {
   
    let infoView = InfoView()
    
    override func loadView() {
        view = infoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoView.buttonAcademy.addTarget(self, action: #selector(onButtonAcademyTapped), for: .touchUpInside)
        infoView.buttonFitness.addTarget(self, action: #selector(onButtonFitnessTapped), for: .touchUpInside)
        infoView.buttonFood.addTarget(self, action: #selector(onButtonFoodTapped), for: .touchUpInside)
    }
    
    @objc func onButtonAcademyTapped() {
        let infoDetailViewController = InfoDetailsViewController()
        infoDetailViewController.category = "academic"
        navigationController?.pushViewController(infoDetailViewController, animated: true)
    }
    @objc func onButtonFitnessTapped() {
        let infoDetailViewController = InfoDetailsViewController()
        infoDetailViewController.category = "fitness"
        navigationController?.pushViewController(infoDetailViewController, animated: true)
    }
    @objc func onButtonFoodTapped() {
        let infoDetailViewController = InfoDetailsViewController()
        infoDetailViewController.category = "food"
        navigationController?.pushViewController(infoDetailViewController, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
