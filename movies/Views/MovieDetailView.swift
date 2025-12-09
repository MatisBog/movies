//
//  MovieDetailView.swift
//  movies
//
//  Created by Matis Bogaert on 09/12/2025.
//

import SwiftUI

struct MovieDetailView: View {
    var movie : Movie
    
    var body: some View {
        VStack{
            Text(movie.title)
                .font(.largeTitle)
                .foregroundStyle(.red)
            Text(movie.description)
        }
        Divider()
        VStack{
            Text("Actors").bold()
            ForEach(movie.actors, id: \.self) { actor in
                NavigationLink("\(actor.firstName) \(actor.lastName)", value: Route.actor(actor)).foregroundStyle(.red)
            }
        }
        Divider()
        VStack{
            Text("Director").bold()
            NavigationLink("\(movie.director.firstName)", value: Route.director(movie.director)).foregroundStyle(.red)
        }
        Divider()
        PathView()
    }
}

