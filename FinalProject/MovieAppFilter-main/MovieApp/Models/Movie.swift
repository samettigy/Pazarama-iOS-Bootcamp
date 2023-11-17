//
//  Movie.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import Foundation

struct Movie : Decodable {
    let Search: [MovieResult]?
}

struct MovieResult : Decodable {
    let title : String
    let year : String
    let imdbID : String
    let poster : String
    
    
    enum CodingKeys : String , CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
    
    
    
}
