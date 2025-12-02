//
//  Route.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import Foundation

enum Route: Hashable {
    case movie(Movie)
    case actor(Actor)
    case director(Director)
}
