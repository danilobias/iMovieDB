//
//  MovieCollectionViewCell.swift
//  iMovieDB
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var filmImageView: UIImageView!
    
    // MARK: - Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.filmImageView.kf.cancelDownloadTask()
        self.filmImageView.image = UIImage(named: "ic_claquete_large")!
    }
    
    // MARK: - Layout configs
    func loadImage(urlString: String) {
        if let url = URL(string: urlString) {
            let placeholderImage = UIImage(named: "ic_claquete_large")!
            self.filmImageView.kf.setImage(with: url, placeholder: placeholderImage)
        }
    }
}
