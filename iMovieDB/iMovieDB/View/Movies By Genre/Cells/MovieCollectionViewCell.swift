//
//  MovieCollectionViewCell.swift
//  iMovieDB
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var filmImageView: UIImageView!
    
    // MARK: - Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.filmImageView.image = nil
    }
}
