//
//  PathView.swift
//  movies
//
//  Created by Matis Bogaert on 02/12/2025.
//

import SwiftUI

struct PathView: View {
    @Environment(PathStore.self) var pathStore
    var body: some View {
        VStack{
            
            Text("Overview navigationStack").bold()
            
            ForEach(pathStore.path.enumerated(), id: \.offset) { index, pathEL in
                switch pathEL {
                case let .actor(pathEL):
                    Button("\(pathEL.firstName) \(pathEL.lastName)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                case let .director(pathEL):
                    Button("\(pathEL.firstName) \(pathEL.lastName)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                case let .movie(pathEL):
                    Button("\(pathEL.title)") {
                        pathStore.path = Array(pathStore.path.prefix(index + 1))
                    }
                }
            }
            Button("Clear") {
                pathStore.path = [Route]()
            }
        }
    }
}


