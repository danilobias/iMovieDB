//
//  MoviesByGenreViewmodel.swift
//  iMovieDB
//
//  Created by Danilo on 23/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

protocol MoviesByGenreViewModelProtocol: ListProtocol {
    var moviesByGenre: [MoviesByGenreResponse] { get }
    var responseDidChange: ((MoviesByGenreViewModelProtocol) -> Void)? { get set }
}

class MoviesByGenreViewModel: MoviesByGenreViewModelProtocol {
    
    // MARK: - Vars
    var genreID: String
    var moviesByGenre: [MoviesByGenreResponse] {
        didSet{
            self.responseDidChange?(self)
        }
    }

    var url: String = Constants.APIUrls.getAllGenres
    var responseDidChange: ((MoviesByGenreViewModelProtocol) -> Void)?
    
    // MARK: - Methods
    required init() {
        genreID = ""
        moviesByGenre = []
    }
    
    // MARK: - Utils
    func numberOfRows() -> Int{
        return moviesByGenre.count
    }
    
    func getMoviesBy(index: Int) -> MoviesByGenreResponse {
        return moviesByGenre[index]
    }

    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {

        let url: String = String(format: Constants.APIUrls.getMovieByGenre, genreID)
        GenresRequest.getMoviesByGenre(withURL: url) { (moviesResponse, error) in
            if let allMovies = moviesResponse {
                self.moviesByGenre.append(allMovies)
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
