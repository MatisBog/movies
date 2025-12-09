//
//  DirectorView.swift
//  movies
//
//  Created by Matis Bogaert on 04/12/2025.
//

import SwiftUI

struct DirectorView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    var director : Director
    var body: some View {
        VStack{
            Text("Director : \(director.firstName) \(director.lastName)").bold()
            Divider()
            ForEach(movieDataStore.getMovies(director: director), id: \.self) { movie in
                NavigationLink("\(movie.title)", value: Route.movie(movie)).foregroundStyle(.red)
            }
            Divider()
            ForEach(movieDataStore.getActors(director: director), id: \.self) { actor in
                NavigationLink("\(actor.firstName) \(actor.lastName)", value: Route.actor(actor)).foregroundStyle(.red)
            }
            Divider()
            PathView()
        }
        
    }
}

