//
//  MoviesListViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 24.09.2023.
//

import Foundation
import SwiftUI

class MoviesListViewModel : ObservableObject {
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovies(searchText : String) {
        downloaderClient.downloadMovies(search: searchText) { (response) in
            switch response {
            case .failure(let err) : print(err)
            case .success(let moviesList):
                if let moviesList = moviesList {
                    DispatchQueue.main.async {
                        self.movies = moviesList.map(MovieViewModel.init)
                    }
                }
           
            }
        }
    }
}

struct MovieViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
