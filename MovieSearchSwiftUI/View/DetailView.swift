//
//  DetailView.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 27.09.2023.
//

import SwiftUI

struct DetailView: View {
    let imdbId : String
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            if movieDetailViewModel.movieDetail == nil {
                Image("placeholder2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.6,
                           height: UIScreen.main.bounds.height * 0.3,
                           alignment: .center)
            } else {
                HStack{
                    Spacer()
                    CustomImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.6,
                               height: UIScreen.main.bounds.height * 0.3,
                               alignment: .centerFirstTextBaseline)
                    Spacer()
                }
                HStack{
                    Text(movieDetailViewModel.movieDetail?.title ?? "")
                        .font(.title)
                        .padding()
                    
                    Text("(\(movieDetailViewModel.movieDetail?.year ?? ""))")
                        .font(.title3)
                        .padding()
                }
                Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "")")
                    .padding()
                Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "")")
                    .padding()
                Text("Actors: \(movieDetailViewModel.movieDetail?.actors ?? "")")
                    .padding()
                Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "")")
                    .padding()
                Text("Plot: \(movieDetailViewModel.movieDetail?.plot ?? "")")
                    .padding()
                Spacer()
            }
        }.onAppear(perform: {
            self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
        }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
