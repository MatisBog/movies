//
//  MovieDataStore.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import Foundation
import Observation

@Observable

class MovieDataStore {
    private var movies = Movies()
    
    init(){
        
    }
    
    func getMovies() -> [Movie]{
        return movies.movies
    }
    
    func getMovies(actor: Actor) -> [Movie]{
        return movies.movies.filter { movie in
            movie.actors.contains(actor)
        }
    }
    
    func getMovies(director : Director) -> [Movie]{
        return movies.movies.filter { movie in
            movie.director == director
        }
    }
    
    func getActors(director : Director) -> [Actor]{
        var actors : [Actor] = []
        
        for movie in movies.movies where movie.director == director {
            actors.append(contentsOf: movie.actors)
        }
        return actors
    }
    
    private func sort() {
        movies.movies = movies.movies.sorted()
    }
    
    func loadData() async {
        do{
            movies = try load("movies.json")
            sort()
        }
        catch{
            print("Failed to load uurrooster",error)
            movies.movies = []
        }
    }
}
