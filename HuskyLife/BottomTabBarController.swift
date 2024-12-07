//
//  BottomTabBarController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit
import FirebaseAuth

class BottomTabBarController: UITabBarController {
    
    var currentUser:FirebaseAuth.User?
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleAuth = Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                print("No user is signed in.")
            } else {
                print("got here")

                let calendar = CalendarViewController()
                calendar.currentUser = user
                let calendarNav = UINavigationController(rootViewController: calendar)
                calendarNav.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 0)
                
                let timer = FakeTimerViewController()
                let timerNav = UINavigationController(rootViewController: timer)
                timerNav.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(systemName: "timer"), tag: 1)

                let location = FakeMapViewController()
                let locationNav = UINavigationController(rootViewController: location)
                locationNav.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "location"), tag: 2)

                let info = FakeInfoViewController()
                let infoNav = UINavigationController(rootViewController: info)
                infoNav.tabBarItem = UITabBarItem(title: "Info", image: UIImage(systemName: "info.circle"), tag: 3)

                let profile = ProfileViewController()
                let profileNav = UINavigationController(rootViewController: profile)
                profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 4)

                // Add all view controllers to the tab bar
                self.viewControllers = [calendarNav, timerNav, locationNav, infoNav, profileNav]
            }
        }

        

        // Customize the tab bar appearance
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
    }
}
