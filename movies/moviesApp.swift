//
//  moviesApp.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import SwiftUI

@main
struct moviesApp: App {
    @State var dataStore = MovieDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataStore)
                .environment(pathStore)
        }
    }
}
