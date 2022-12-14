//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?apikey=\(Constants.apiKey)&s=\(name))")
    }
    
    static func forMovieByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?apikey=\(Constants.apiKey)&i=\(imdbId))")
    }
    
}
