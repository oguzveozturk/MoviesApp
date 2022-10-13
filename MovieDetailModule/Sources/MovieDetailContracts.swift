//
//  MovieDetailContracts.swift
//  MovieDetailModule
//
//  Created by Oğuz Öztürk on 14.10.2022.
//

import Foundation
import Common

protocol MovieDetailPresenterProtocol: AnyObject {
    func load()
}

protocol MovieDetailViewProtocol: AnyObject {
    func handleOutput(_ output:MoviePresentation)
}
