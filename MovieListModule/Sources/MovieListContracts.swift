//
//  MovieListContracts.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation
import MoviesAPI
import Common

protocol MovieListInteractorProtocol:AnyObject {
    var delegate: MovieListInteractorDelegate? { get set }
    func fetchMovies()
}

protocol MovieListInteractorDelegate: AnyObject {
    func handleOutput(_ output:MovieListInteractorOutput)
}

enum MovieListInteractorOutput {
    case loading(Bool)
    case showList([Movie])
}

protocol MovieListPresenterProtocol:AnyObject {
    var movies:[MoviePresentation] { get set }
    func load()
    func movie(_ at:Int) -> MoviePresentation
    func selectMovie(at index:Int)
}

enum MovieListPresenterOutput {
    case setTitle(String)
    case loading(Bool)
    case showList([MoviePresentation])
}

protocol MovieListViewProtocol: AnyObject {
    func setTitle(_ text: String)
    func setLoading(_ isLoading:Bool)
    func reloadData()
}

enum MovieListRoute: Equatable {
    case detail(MoviePresentation)
}

protocol MovieListRouterProtocol: AnyObject {
    func navigate(to route: MovieListRoute)
}
