//
//  MovieListPresenter.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation
import Common

final class MovieListPresenter:MovieListPresenterProtocol {
    
    var movies = [MoviePresentation]()
    
    private let interactor:MovieListInteractorProtocol!
    private let view:MovieListViewProtocol!
    private let router:MovieListRouterProtocol!
    
    init(view:MovieListViewProtocol!,
         interactor:MovieListInteractorProtocol!,
         router:MovieListRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        view.setTitle("Movies")
        interactor.fetchMovies()
    }
    
    func selectMovie(at index: Int) {
        router.navigate(to: .detail(movies[index]))
    }
    
    func movie(_ at:Int) -> MoviePresentation {
        movies[at]
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .loading(let bool):
            view.setLoading(bool)
        case .showList(let movies):
            self.movies = movies.map(MoviePresentation.init)
            view.reloadData()
        }
    }
}
