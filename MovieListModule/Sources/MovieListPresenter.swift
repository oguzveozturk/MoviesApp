//
//  MovieListPresenter.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation
import Common

final class MovieListPresenter:MovieListPresenterProtocol {
    
    private var movies = [MoviePresentation]()
    
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
        view.handleOutput(.setTitle("Movies"))
        interactor.load()
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .loading(let bool):
            view.handleOutput(.loading(bool))
        case .showList(let movies):
            view.handleOutput(.showList(movies.map(MoviePresentation.init)))
        case .showDetail(let movie):
            router.navigate(to: .detail(MoviePresentation(movie: movie)))
        }
    }
}
