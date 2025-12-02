//
//  Movie.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import Foundation

struct Movie : Codable, Hashable {
    var title : String
    var description : String
    var actors: [Actor]
    var director : Director
    var releaseDate : String
}
