//
//  MovieDetailViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 27.09.2023.
//

import Foundation

class MovieDetailViewModel : ObservableObject {
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId: String) {
        downloaderClient.downloadMoviDetail(imdbId: imdbId) { response in
            switch response {
            case .failure(let error) : print(error)
            case .success(let data) :
                DispatchQueue.main.async{
                    self.movieDetail = MovieDetailsViewModel(detail: data)
                }
            }
        }
    }
}

struct MovieDetailsViewModel {
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
    var imdbRating : String {
        detail.imdbRating
    }
    
    var genre : String {
        detail.genre
    }
    
    var metascore : String {
        detail.metascore
    }
    
    var writer : String {
        detail.writer
    }
    
    var actors : String {
        detail.actors
    }
}
