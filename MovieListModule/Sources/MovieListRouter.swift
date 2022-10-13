//
//  MovieListRouter.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import UIKit
import MovieDetailModule

final class MovieListRouter: MovieListRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            view.show(MovieDetailBuilder.make(movie: movie), sender: nil)
        }
    }
}
