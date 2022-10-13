//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import UIKit
import MovieListModule

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.router.start()
        return true
    }
}

