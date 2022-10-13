//
//  MoviePresentation.swift
//  Common
//
//  Created by Oğuz Öztürk on 14.10.2022.
//

import Foundation
import MoviesAPI

public struct MoviePresentation: Equatable {
    public let title:String
    public let detail:String
    
    public init(movie:Movie) {
        self.title = movie.collectionName ?? "unknown"
        self.detail = movie.artistName
    }
}
