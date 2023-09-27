//
//  DownloaderClient.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 23.09.2023.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=17aab30d&s=\(search)") else {
              return completion(.failure(.wrongUrl))
          }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataIsNotFound))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                return completion(.failure(.dataIsNotProcessed))
            }
            completion(.success(movieResponse.movies))
        }.resume()
    }
    
    func downloadMoviDetail(imdbId: String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=17aab30d&i=\(imdbId)") else {
              return completion(.failure(.wrongUrl))
          }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataIsNotFound))
            }
            
            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.dataIsNotProcessed))
            }
            completion(.success(movieDetailResponse))
        }.resume()
    }
    
    
}

enum DownloaderError : Error {
    case wrongUrl
    case dataIsNotFound
    case dataIsNotProcessed
}
