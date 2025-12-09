//
//  ContentView.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self)var movieDataStore
    @State var loading = true
    var body: some View {
        @Bindable var pathStore = pathStore
        VStack {
            if loading {
                ProgressView("Loading...")
            }else {
                NavigationStack(path: $pathStore.path) {
                    ForEach(movieDataStore.getMovies(), id: \.self) { movie in
                        NavigationLink(value: Route.movie(movie)) {
                            VStack(alignment: .leading) {
                                Text(movie.title).bold()
                                Text(movie.description)
                                Divider()
                            }
                        }
                    }
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case let .actor(actor : actor):
                            ActorView(actor : actor)
                        case let .director(director : director):
                            DirectorView(director : director)
                        case let .movie(movie: movie):
                            MovieDetailView(movie:  movie)
                        }
                    }
                }
            }
        }.task {
            await movieDataStore.loadData()
            loading = false}
    }
}

