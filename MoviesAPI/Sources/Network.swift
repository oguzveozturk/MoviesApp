//
//  Network.swift
//  MoviesAPI
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import Foundation

public protocol TopMovieListProtocol: AnyObject {
    func fetchMovies(completion: @escaping (Result<[Movie],Error>) -> Void)
}

public class Network:TopMovieListProtocol {
    
    public init() { }
    
    public func fetchMovies(completion: @escaping (Result<[Movie],Error>) -> Void) {
        let url = URL(string: "https://itunes.apple.com/search?entity=movie&attribute=genreTerm")!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.networkError(internal: error)))
                } else if let data = data {
                    do {
                        let decoded = try Decoders.plainDateDecoder.decode(TopMoviesResponse.self, from: data)
                        completion(.success(decoded.results))
                    } catch {
                        completion(.failure(.serializationError(internal: error)))
                    }
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}
