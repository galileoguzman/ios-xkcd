//
//  AppDelegate.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    private let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = appCoordinator.rootViewController
        
        window?.makeKeyAndVisible()
        
        // Start main coordinator
        appCoordinator.start()
        return true
    }
}
