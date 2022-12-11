//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Reenad gh on 16/04/1444 AH.
//

import Foundation
import SwiftUI


class MoviesImdIdsViewModel : ViewModelBase {
   @Published var moviesImdIds = [String]()

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
                        self.moviesImdIds = movies.map({$0.imdbId})
                        self.loadingState = .success

                    }
                }
            }
        }
    }
    
    
    
    
 

}




class MovieViewModel :  ObservableObject {
    
    private var movie : Movie?
    @Published var loadingState : LoadingState = LoadingState.loading
    
    var httpClient = HTTPClient()
    
    var imdbId  : String {
        
        movie?.imdbId ?? ""
        
    }
    
    var title  : String {
        
        movie?.title ?? ""
        
    }
    var poster  : String {
        
        movie?.poster ?? ""
        
    }
    
    var year  : String {
        
        movie?.year ?? ""
        
    }
    
    var type  : String {
        
        movie?.type ?? ""
        
    }
    
 
    
    func getId (type : MatchedType) -> String {
        
        return "\(type)-\(imdbId)"
    }
    
}
