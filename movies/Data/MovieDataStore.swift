//
//  MovieDataStore.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import Foundation

@Observable

class MovieDataStore {
    private var movies = Movies()
    
    init(){
        
    }
    
    func getMovies() -> [Movie]{
        
    }
    
    func getMovies(actor: Actor) -> [Movie]{
        
    }
    
    func getMovies(director : Director) -> [Movie]{
        
    }
    
    func getActors(director : Director) -> [Movie]{
        
    }
    
    private func sort() {
        
    }
    
    func loadData() async {
        do{
            let jsonData : [Movie] = try load("movies.json")
        }
        catch{
            print("Failed to load uurrooster",error)
            movies = Movies()
        }
    }
}
