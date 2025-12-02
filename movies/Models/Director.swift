//
//  Director.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import Foundation

struct Director : Codable, Hashable {
    var firstName: String
    var lastName: String
    var moviesDirected : [String]
}
