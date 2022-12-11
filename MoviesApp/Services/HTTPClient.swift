//
//  HTT Clinet.swift
//  MoviesApp
//
//  Created by Reenad gh on 16/04/1444 AH.
//

import Foundation



enum NetworkError  : Error{
    
    case badUrl
    case noData
    case decodingError
}
class HTTPClient {
    func getMoviesBy(search : String , completion : @escaping ( Result<[Movie]? , NetworkError>)  -> Void ){
        
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badUrl))
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                return completion(.failure(.noData))
            }
            
            
            guard let moviesResponse =  try? JSONDecoder().decode( MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }

            completion(.success(moviesResponse.movies))
            
        }.resume()
        
        
    }
}
