//
//  MovieInfoView.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import SwiftUI

struct MovieInfoView: View {
    @Environment(MovieDataStore.self) private var dataStore
    var movie : Movie
    var body: some View {
        Text("\(movie.title)").fontWeight(.bold)
        Text("\(movie.description)")
    }
}

