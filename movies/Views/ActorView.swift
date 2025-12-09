//
//  ActorView.swift
//  movies
//
//  Created by Matis Bogaert on 04/12/2025.
//

import SwiftUI

struct ActorView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self)var movieDataStore
    var actor : Actor
    var body: some View {
        @Bindable var pathstore = pathStore
        VStack{
            Text("Actor : \(actor.firstName) \(actor.lastName)")
                .bold()
                .foregroundStyle(.red)
            Text("Birthday : \(actor.birthday)")
            
            Divider()
            Text("Movie(s)").bold()
            ForEach(movieDataStore.getMovies(actor: actor), id: \.self) { movie in
                NavigationLink("\(movie.title)", value: Route.movie(movie)).foregroundStyle(.red)
            }
            Divider()
            PathView()
        }
    }
}

