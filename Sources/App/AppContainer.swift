//
//  AppContainer.swift
//  MoviesApp
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation
import MoviesAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = Network()
}

