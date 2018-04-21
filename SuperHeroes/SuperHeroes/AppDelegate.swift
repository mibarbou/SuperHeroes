//
//  AppDelegate.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 17/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        return true
    }
}

