//
//  MovieTableViewCell.swift
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class BTKMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: BTKMovie? {
        didSet {
            updateViews()
        }
    }
    
    
    
    func updateViews() {
        
        guard let movie = movie else { return }
        
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        overviewLabel.text = movie.overview
//        movieImageView.image = movie.image
        
    }

}
