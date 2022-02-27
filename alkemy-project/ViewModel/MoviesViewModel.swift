//
//  MoviesViewModel.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 23/02/2022.
//

import Foundation
import UIKit

class MoviesViewModel {
    
    var dataJson: MoviesData?
    static let baseImageURL = "https://image.tmdb.org/t/p/w300"
    
    func initFetch(dataJson: MoviesData) {
        self.dataJson = dataJson
    }
    
    func fetchMovies(_ serviceCompleted: @escaping (Result<MoviesData, Error>) -> Void) {
        ApiService.getPopularMoviesData() { (dataJsonResult) in
            switch dataJsonResult {
            case .success(let movies):
                self.dataJson = movies
            case .failure:
                self.dataJson = MoviesData(movies: [])
            }
            serviceCompleted(dataJsonResult)
        }
    }
    
    func reloadImage(_ movie: Movie) -> UIImage {
        let imageView = UIImageView()
        if let urlPost = movie.posterImage {
            let urlString = MoviesViewModel.baseImageURL + urlPost
            let fullURL = URL(string: urlString)!
            if let data = try? Data(contentsOf: fullURL) {
                imageView.image = UIImage(data: data)
            }
        }
        return imageView.image ?? UIImage()
    }
    
}
