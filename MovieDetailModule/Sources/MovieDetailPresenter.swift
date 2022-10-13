//
//  MovieDetailPresenter.swift
//  MovieDetailModule
//
//  Created by Oğuz Öztürk on 14.10.2022.
//

import Foundation
import Common

final class MovieDetailPresenter:MovieDetailPresenterProtocol {
    private let view:MovieDetailViewProtocol!
    private let movie:MoviePresentation!
    
    init(view:MovieDetailViewProtocol!,
         movie:MoviePresentation) {
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view.handleOutput(movie)
    }
}
