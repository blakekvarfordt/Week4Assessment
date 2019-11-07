//
//  BTKMovieTableViewController.swift
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class BTKMovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    var movies = [BTKMovie]()
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearchBar.delegate = self
    }
    
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = movieSearchBar.text, !searchTerm.isEmpty else { return }
        
        let searchString = searchTerm.replacingOccurrences(of: " ", with: "+")
        
        movieSearchBar.resignFirstResponder()
        
        BTKMovieController.fetchMovies(withSearchTerm: searchString) { [weak self] (movies) in
            
            guard let self = self else { return }
            
            self.movies = movies
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieSearchBar.text = ""
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? BTKMovieTableViewCell else { return UITableViewCell() }

        
        let movie = self.movies[indexPath.row]
        
        cell.movie = movie
//        cell.imageView?.image = movies.image

        return cell
    }

}
