//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeViewControllerInterface? { get set }
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeViewControllerInterface?
    let service = MovieService()
    var movies : [MovieResult] = []
}

extension HomeViewModel : HomeViewModelInterface {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureTableView()
        view?.configureSearchBar()
        getMovies()
    }
    
    func getMovies() {
        service.fetchMovies { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies = returnedMovies
            print(returnedMovies)
        }
    }
    
    
}
