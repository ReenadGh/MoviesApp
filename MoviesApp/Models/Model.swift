//
//  Model.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import Foundation




struct MovieResponse : Codable  {
    
    let  movies : [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable  , Hashable{
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    let type : String
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
        case type = "Type"

    }
    
    
  
    
}


enum MatchedType : String {
    case title = "Title"
    case shadow = "Shadow"
    case desc = "Desc"
    case stars = "Stars"
    case poster = "Poster"
}


