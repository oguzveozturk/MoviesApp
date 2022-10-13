//
//  MovieListInteractor.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation
import MoviesAPI

final class MovieListInteractor: MovieListInteractorProtocol {
    weak var delegate: MovieListInteractorDelegate?
    
    private var movies = [Movie]()
    private let service:TopMovieListProtocol!
    
    init(service:TopMovieListProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.loading(true))
        
        service.fetchMovies { [weak self] result in
            self?.delegate?.handleOutput(.loading(false))
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.delegate?.handleOutput(.showList(movies))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        delegate?.handleOutput(.showDetail(movies[index]))
    }
}
