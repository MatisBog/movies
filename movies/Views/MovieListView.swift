//
//  MovieListView.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import SwiftUI

struct MovieListView: View {
    @Environment(MovieDataStore.self) private var dataStore
    @State var selectedMovie : Movie?
    @State var loading = true
    var body: some View {
        if loading {
            ProgressView()
        }else {
            List(dataStore.getMovies(), id:\.self, selection: $selectedMovie){movie in
                MovieInfoView(movie : movie)
            }
        }
    }
}

#Preview {
    MovieListView()
}
