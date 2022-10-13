//
//  AppRouter.swift
//  MoviesApp
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import UIKit
import MovieListModule

final class AppRouter {
    var window: UIWindow?

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = MovieListBuilder.make(service: app.service)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
