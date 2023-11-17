//
//  MovieCell.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView
    private var titleLabel : UILabel!
    private var yearLabel : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        posterImageView = PosterImageView(frame: .zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
        configurePosterImageView()
        configureTitleLabel()
        configureYearLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.fetchImage(movie: movie)
        titleLabel.text = movie.title
        yearLabel.text = movie.year
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
    }
    
    private func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            
        ])
        
    }
    
    private func configureYearLabel() {
        yearLabel = UILabel(frame: .zero)
        addSubview(yearLabel)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.textAlignment = .center
        
        yearLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            yearLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 30),
            yearLabel.widthAnchor.constraint(equalToConstant: 150),
            
        ])
        
    }
    
    private func configurePosterImageView() {
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            posterImageView.widthAnchor.constraint(equalToConstant: 150),
            posterImageView.heightAnchor.constraint(equalToConstant: 250),
            
        ])
    }
    
}
