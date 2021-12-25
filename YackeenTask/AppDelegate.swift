//
//  AppDelegate.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        var vc = UINavigationController()
        vc = UINavigationController(rootViewController: LaunchScreenViewController())
        vc.isNavigationBarHidden = true
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
}

