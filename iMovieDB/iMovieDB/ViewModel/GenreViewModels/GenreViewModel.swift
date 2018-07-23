//
//  GenreViewModel.swift
//  iMovieDB
//
//  Created by Danilo on 03/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

protocol GenreViewModelProtocol: ListProtocol {
    var response: GenreResponse? { get }
    var responseDidChange: ((GenreViewModelProtocol) -> Void)? { get set }
}

class GenreViewModel: GenreViewModelProtocol {

    // MARK: - Vars
    var response: GenreResponse? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    var url: String = Constants.APIUrls.getAllGenres
    var responseDidChange: ((GenreViewModelProtocol) -> Void)?
    
    // MARK: - Methods
    required init() {}
    
    func numberOfRows() -> Int{
        return response?.genres?.count ?? 0
    }
    
    func getElement(completion: @escaping (Error?) -> Void) {
        
        GenresRequest.getAllGenres(withURL: Constants.APIUrls.getAllGenres) { (genreResponse, error) in
            if let allGenres = genreResponse {
                self.response = allGenres
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
