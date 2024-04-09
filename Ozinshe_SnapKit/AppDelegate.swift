//
//  AppDelegate.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            // Create the window
            window = UIWindow(frame: UIScreen.main.bounds)
            
            // Create the root view controller
            let onboardingViewController = OnboardingViewController()
            
            // Create the navigation controller and set its root view controller
            let navigationController = UINavigationController(rootViewController: onboardingViewController)
            
            // Set the navigation controller as the root view controller of the window
            window?.rootViewController = navigationController
            
            // Make the window visible
            window?.makeKeyAndVisible()
            
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

