//
//  FavoritesTableViewController.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 23/02/2022.
//

import UIKit

class FavoritesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var viewModel: MoviesViewModel = {
        return MoviesViewModel()
    }()

    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        initFetchViewModel()
        self.favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.navigationBar.isHidden = true
            super.tabBarController?.title = "Favorites"
        }
    
    override func viewDidAppear(_ animated: Bool) {
        self.initFetchViewModel()
    }
    
    func initFetchViewModel() {
        DispatchQueue.main.async {
            self.viewModel.fetchMovies(){ _ in
                self.favoritesTableView.reloadData()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        vc.movie = filterMovies()[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterMovies().count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
        let row = filterMovies()[indexPath.row]
        cell.favoriteTitleLabel.text = row.title
        cell.ratingLabel.text = "\(row.rate ?? Double())⭐️"
        cell.favoriteImageView.image = reloadImage(row)
        return cell
        
    }
    func filterMovies() -> [Movie] {
        let arrayOfFavorites = AppDelegate.getUserDefaultArrayStringForKey("moviesStored") ?? []
        let listOfMovies = viewModel.dataJson?.movies
        guard let favoriteList = listOfMovies?.filter( { arrayOfFavorites.contains($0.title ?? String()) } ) else { return [] }
        return favoriteList
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
