//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Reenad gh on 17/04/1444 AH.
//

import Foundation

enum LoadingState {
    case loading , success , falied , none
}

class ViewModelBase : ObservableObject {
    
    @Published var loadingState : LoadingState = .none
}
