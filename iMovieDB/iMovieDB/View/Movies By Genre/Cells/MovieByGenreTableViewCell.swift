//
//  MovieByGenreTableViewCell.swift
//  iMovieDB
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

class MovieByGenreTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var filmsCollectionView: UICollectionView!
    
    // MARK: - Lets and Vars
    var moviesByGenre: MoviesByGenreResponse!

    // MARK: - TableViewCell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Utils
    func getMovieBy(index: Int) -> MovieByGenre {
        return self.moviesByGenre!.movies![index]
    }

    // MARK: - Layout configs
    func configCellWith(movies: MoviesByGenreResponse) {
        self.moviesByGenre = movies
        self.filmsCollectionView.reloadData()
    }
}

extension MovieByGenreTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesByGenre.movies?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let movie: MovieByGenre = self.getMovieBy(index: indexPath.row)
        cell.loadImage(urlString: movie.posterFullUrl)
        return cell
    }
}
