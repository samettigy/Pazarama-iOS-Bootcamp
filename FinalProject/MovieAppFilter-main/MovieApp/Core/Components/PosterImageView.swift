//
//  PosterImageView.swift
//  MovieApp
//
//  Created by Samet TIG on 7.11.2023.
//

import UIKit

class PosterImageView: UIImageView {
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func fetchImage(movie: MovieResult) {
            guard let url = URL(string: NetworkHelpers.imageURL(imdbID: movie.imdbID)) else {
                print("Hata: Resim URL'si oluşturulamadı.")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Hata: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("Hata: Veri boş.")
                    return
                }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
                
            }.resume()
        }
    
  
    
}
