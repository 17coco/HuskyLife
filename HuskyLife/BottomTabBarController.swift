//
//  BottomTabBarController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//

import UIKit
import FirebaseAuth

class BottomTabBarController: UITabBarController {
    
    var currentUser: FirebaseAuth.User?
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleAuth = Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                print("No user is signed in.")
            } else {
                print("got here")
                
                // Calendar Tab
                let calendar = CalendarViewController()
                calendar.currentUser = user
                let calendarNav = UINavigationController(rootViewController: calendar)
                calendarNav.tabBarItem = UITabBarItem(
                    title: "Calendar",
                    image: UIImage(systemName: "calendar")?.withRenderingMode(.alwaysTemplate),
                    tag: 0
                )
                calendarNav.navigationBar.topItem?.title = "Calendar"
                
                // Timer Tab
                let timer = TrackerMainViewController()
                timer.currentUser = user
                let timerNav = UINavigationController(rootViewController: timer)
                timerNav.tabBarItem = UITabBarItem(
                    title: "Timer",
                    image: UIImage(systemName: "timer")?.withRenderingMode(.alwaysTemplate),
                    tag: 1
                )
                timerNav.navigationBar.topItem?.title = "Task Tracker"
                
                // Location Tab
                let location = MapViewController()
                let locationNav = UINavigationController(rootViewController: location)
                locationNav.tabBarItem = UITabBarItem(
                    title: "Location",
                    image: UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysTemplate),
                    tag: 2
                )
                location.navigationItem.title = "Search in Map"
                
                // Info Tab
                let info = InfoViewController()
                let infoNav = UINavigationController(rootViewController: info)
                infoNav.tabBarItem = UITabBarItem(
                    title: "Info",
                    image: UIImage(systemName: "info.circle.fill")?.withRenderingMode(.alwaysTemplate),
                    tag: 3
                )
                infoNav.navigationBar.topItem?.title = "Info"
                
                // Profile Tab
                let profile = ProfileViewController()
                let profileNav = UINavigationController(rootViewController: profile)
                profileNav.tabBarItem = UITabBarItem(
                    title: "Profile",
                    image: UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate),
                    tag: 4
                )
                profileNav.navigationBar.topItem?.title = "My Profile"
                
                self.viewControllers = [calendarNav, timerNav, locationNav, infoNav, profileNav]
            }
        }
        
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}
