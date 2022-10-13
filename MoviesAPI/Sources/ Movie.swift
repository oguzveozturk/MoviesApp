//
//   Movie.swift
//  MoviesAPI
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation


public struct Movie: Decodable, Equatable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case collectionName
        case copyright
        case image = "artworkUrl100"
        case primaryGenreName
    }
    
    public let artistName: String
    public let releaseDate: String
    public let collectionName: String?
    public let copyright: String?
    public let image: URL
    public let primaryGenreName: String
}

public struct TopMoviesResponse: Decodable {
    let results:[Movie]
}

public enum Decoders {
    public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}

public enum Error: Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
    case unknown
}
