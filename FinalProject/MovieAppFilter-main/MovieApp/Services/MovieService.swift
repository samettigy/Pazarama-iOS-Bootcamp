//
//  MovieService.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import Foundation

class MovieService {
    
    func fetchMovies(completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: NetworkHelpers.movies(query: "batman")) else {
            return
        }
        
        NetworkManager.shared.fetch(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
               completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
            
        }

    }
    
    
    func handleWithError(_ error : Error) {
        print(error.localizedDescription)
    }
    
    func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.Search
        }catch {
            print(error)
            return nil
        }
    }
    
    
}
