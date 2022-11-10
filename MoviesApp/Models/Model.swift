//
//  Model.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import Foundation


struct Movie: Codable  , Hashable{
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
     enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
    
    
  
    
    
    func getId (type : MatchedType) -> String {
        
        return "\(type)-\(title)-\(year)"
    }
    
}


enum MatchedType : String {
    case title = "Title"
    case shadow = "Shadow"
    case desc = "Desc"
    case stars = "Stars"
    case poster = "Poster"
}
