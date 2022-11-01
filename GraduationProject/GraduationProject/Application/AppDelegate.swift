//
//  AppDelegate.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//

import UIKit
import Firebase
import netfox

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        FirebaseApp.configure()

        NFX.sharedInstance().start()

        let currenUser = Auth.auth().currentUser

        if currenUser != nil {
            let home = TabBar()
            self.window?.rootViewController = home
            window?.makeKeyAndVisible()
        } else {
            AppRouter.shared.start()
        }
        return true
    }
}

