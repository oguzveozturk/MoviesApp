//
//  MovieDetailBuilder.swift
//  MovieDetailModule
//
//  Created by Oğuz Öztürk on 14.10.2022.
//

import Foundation
import Common

public final class MovieDetailBuilder {
    
    public static func make(movie:MoviePresentation) -> MovieDetailViewController {
        let view = MovieDetailViewController()
        let presenter = MovieDetailPresenter(view: view, movie: movie)
        view.presenter = presenter
        return view
    }
}
