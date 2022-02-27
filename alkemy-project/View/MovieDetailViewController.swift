//
//  MovieDetailViewController.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 23/02/2022.
//

import UIKit


class MovieDetailViewController: UIViewController, UITextViewDelegate {
    
    var movie: Movie?
    
    @IBOutlet weak var detailMovieImage: UIImageView!
    @IBOutlet weak var detailMovieLabel: UILabel!
    @IBOutlet weak var detailMovieTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMovieTextView.delegate = self
        detailMovieLabel.text = movie?.title
        detailMovieTextView.text = movie?.overview
        detailMovieImage.image = reloadImage(movie!)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


