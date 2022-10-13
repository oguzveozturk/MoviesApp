//
//  MovieListBuilder.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import MoviesAPI

public final class MovieListBuilder {
    
    public static func make(service:TopMovieListProtocol) -> MovieListViewController {
        let view = MovieListViewController()
        let router = MovieListRouter(view: view)
        let interactor = MovieListInteractor(service: service)
        let presenter = MovieListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        return view
    }
}
