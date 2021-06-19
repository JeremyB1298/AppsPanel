//
//  AppDelegate.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: "navigationViewController")

            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        return true
    }

}

