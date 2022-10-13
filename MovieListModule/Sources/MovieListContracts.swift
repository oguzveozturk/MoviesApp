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
    func load()
    func selectMovie(at index:Int)
}

protocol MovieListInteractorDelegate: AnyObject {
    func handleOutput(_ output:MovieListInteractorOutput)
}

enum MovieListInteractorOutput {
    case loading(Bool)
    case showList([Movie])
    case showDetail(Movie)
}

protocol MovieListPresenterProtocol:AnyObject {
    func load()
    func selectMovie(at index:Int)
}

enum MovieListPresenterOutput {
    case setTitle(String)
    case loading(Bool)
    case showList([MoviePresentation])
}

protocol MovieListViewProtocol: AnyObject {
    func handleOutput(_ output: MovieListPresenterOutput)
}

enum MovieListRoute: Equatable {
    case detail(MoviePresentation)
}

protocol MovieListRouterProtocol: AnyObject {
    func navigate(to route: MovieListRoute)
}
