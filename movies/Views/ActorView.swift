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
            
            List(movieDataStore.getMovies(actor: actor), id: \.self, selection: $pathstore) { movie in
                NavigationLink(value: Route.movie(<#T##Movie#>), label: <#T##() -> View#>)
            }
        }
    }
}

