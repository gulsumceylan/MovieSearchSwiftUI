//
//  ContentView.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 23.09.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel : MoviesListViewModel
    
    @State var searchText = ""
    
    init() {
        self.movieListViewModel = MoviesListViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search Movie", text: $searchText, onEditingChanged: {
                    _ in
                }, onCommit: {
                    self.movieListViewModel.searchMovies(searchText: searchText
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                        .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id: \.imdbId) { movie in
                    NavigationLink(
                        destination: {
                            DetailView(imdbId: movie.imdbId)
                        },
                        label: {
                            HStack {
                                CustomImage(url: movie.poster)
                                    .frame(width: 90, height: 130)
                                
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.title3)
                                        .foregroundColor(.cyan)
                                    
                                    Text(movie.year)
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                    )
                }.navigationTitle(Text("Movies"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
