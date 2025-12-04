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
    @State var selectedMovie : Movie?
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path) {
            if loading {
                ProgressView("Loading...")
            }else {
                List(movieDataStore.getMovies(), id: \.self, selection: $selectedMovie) { movie in
                    NavigationLink(value: Route.movie(movie)) {
                        VStack(alignment: .leading) {
                            Text(movie.title).bold()
                            Text(movie.description)
                            Divider()
                        }.navigationDestination(for: Route.self) { route in
                            switch route {
                            case let .actor(actor : actor):
                                ActorView(actor : actor)
                            case let .director(director : director):
                                DirectorView(director : director)
                            case let .movie(movie: movie):
                                ContentView
                            }
                        }
                    }
                }PathView()
            }
        }.task {
            await movieDataStore.loadData()
            loading = false
        }
        
    }
}

#Preview {
    ContentView()
}
