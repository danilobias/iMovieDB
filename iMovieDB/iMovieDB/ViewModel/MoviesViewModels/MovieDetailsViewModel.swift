//
//  MovieDetailsViewModel.swift
//  iMovieDB
//
//  Created by Danilo on 03/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

protocol MovieDetailsViewModelProtocol: SingleElement {
    var response: MovieDetail? { get }
    var responseDidChange: ((MovieDetailsViewModelProtocol) -> Void)? { get set }
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    var response: MovieDetail? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var responseDidChange: ((MovieDetailsViewModelProtocol) -> Void)?
    
    required init() {}
    
    func getElement(withURL url: String, completion: @escaping (Error?) -> Void) {
        
        MoviesRequest.getMovieDetails(withURL: url) { (movieDetailsResponse, error) in
            
            if let movieDetails = movieDetailsResponse {
                self.response = movieDetails
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
