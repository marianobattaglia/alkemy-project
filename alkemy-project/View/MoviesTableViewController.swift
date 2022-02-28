//
//  MoviesTableViewController.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 23/02/2022.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var viewModel: MoviesViewModel = {
        return MoviesViewModel()
    }()

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        initFetchViewModel()
        self.moviesTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.navigationBar.isHidden = true
            super.tabBarController?.title = "Movies"
        }
    
    func initFetchViewModel() {
        DispatchQueue.main.async {
            self.viewModel.fetchMovies() { _ in
                self.moviesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexCell = indexPath.row
        let movieSelected = viewModel.dataJson?.movies[indexCell]
        let movieVC = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        movieVC.movie = movieSelected
        self.present(movieVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataJson?.movies.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        let row = viewModel.dataJson?.movies[indexPath.row]
        cell.movieTitle.text = row?.title
        if let movie = row {
            cell.movieProfileImage.image = self.viewModel.reloadImage(movie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

