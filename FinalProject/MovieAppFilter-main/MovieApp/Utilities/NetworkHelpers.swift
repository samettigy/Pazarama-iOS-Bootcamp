//
//  NetworkHelpers.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import UIKit

class NetworkHelpers {
    
    static func movies(query: String) -> String {
        "http://www.omdbapi.com/?apikey=e4d6fa3b&s=\(query)"
    }
    
    static func imageURL(imdbID: String) -> String {
        "http://img.omdbapi.com/?apikey=e4d6fa3b&i=\(imdbID)"
    }
    
    static func titleURL(title: String) -> String {
        "http://www.omdbapi.com/?apikey=e4d6fa3b&t=\(title)"
    }
    
}
