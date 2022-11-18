//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Reenad gh on 16/04/1444 AH.
//

import Foundation


class MoviesListViewModel : ViewModelBase {
   @Published var movies = [MovieViewModel]()
    var httpClient = HTTPClient()
    
    func getMovieBySearch(search : String){
        
        self.loadingState = .loading
        if search.isEmpty{
            self.loadingState = .none

            return
        }
        httpClient.getMoviesBy(search: search.trimmedAndEscaped()) { result in
            switch result {
            case .failure(let error ) :
                print("error in searching for a movie : \(error)")
                DispatchQueue.main.async {
                    self.loadingState = .falied
                }
            case .success(let movies) :
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            }
        }
    }
}

struct MovieViewModel : Hashable {
    let movie : Movie
    
    var imdbId  : String {
        
        movie.imdbId
        
    }
    
    var title  : String {
        
        movie.title
        
    }
    var poster  : String {
        
        movie.poster
        
    }
    
    var year  : String {
        
        movie.year
        
    }
    
    
    
    func getId (type : MatchedType) -> String {
        
        return "\(type)-\(title)-\(year)"
    }
    
}
