//
//  AppDelegate.swift
//  Improving
//
//  Created by Bruno Wide on 29/11/19.
//  Copyright © 2019 BWide. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        startApplicationCoordinator(with: window)
        
        return true
    }

    
    func startApplicationCoordinator(with window: UIWindow) {
        let applicationCoordinator = ApplicationCoordinator(window: window)
        
        self.applicationCoordinator = applicationCoordinator
        
        
        applicationCoordinator.start()
    }
}

