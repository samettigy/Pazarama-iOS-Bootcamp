//
//  ViewController.swift
//  MovieApp
//
//  Created by Samet TIG on 6.11.2023.
//

import UIKit

protocol HomeViewControllerInterface : AnyObject{
    func configureVC()
    func configureTableView()
    func configureSearchBar()
}

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var tableView : UITableView!
    private var searchBar : UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
    
}



extension HomeViewController : HomeViewControllerInterface {
    
    func configureSearchBar() {
        searchBar = UISearchBar()
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Batman"
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor)
        ])
        
    }
    
    func configureTableView() {
        tableView = UITableView(frame: .zero)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.backgroundColor = .white
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
    }
    
    func configureVC() {
        view.backgroundColor = .white
    }
}



extension HomeViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight: CGFloat = 300
        return cellHeight
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text changed: \(searchText)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.backgroundColor = .white
        cell.setCell(movie: viewModel.movies[indexPath.row])
        
        return cell
    }
    
    
    
    
}

