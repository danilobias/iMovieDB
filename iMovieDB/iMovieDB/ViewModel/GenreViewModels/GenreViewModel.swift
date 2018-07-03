//
//  GenreViewModel.swift
//  iMovieDB
//
//  Created by Danilo on 03/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

//class GenreViewModel: NSObject {
//
//}


protocol GenreViewModelProtocol: ListProtocol {
    var response: GenreResponse? { get }
    var responseDidChange: ((GenreViewModelProtocol) -> Void)? { get set }
}

class GenreViewModel: GenreViewModelProtocol {
    
    var response: GenreResponse? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var url: String = Constants.APIUrls.getAllPlanetsUrl
    var responseDidChange: ((GenreViewModelProtocol) -> Void)?
    
    required init() {}
    
    func numberOfRows() -> Int{
        return response?.genres?.count ?? 0
    }
    
    func getElement(firstPage: Bool, completion: @escaping (Error?) -> Void) {
        
        if firstPage == true {
            self.url = Constants.APIUrls.getAllPlanetsUrl
        }
        
        GenresRequest.getAllGenres(withURL: Constants.APIUrls.getAllPlanetsUrl) { (genreResponse, error) in
            if let allGenres = genreResponse {
                //                self.response = allPlanets
                
                if firstPage == true {
                    self.response = allGenres
                }
                else {
                    // TO-DO
                    // Pagination
//                    self.response?.next = allPlanets.next
//                    self.response?.previous = allPlanets.previous
//                    self.response?.count = allPlanets.count
                    self.response?.genres?.append(contentsOf: allGenres.genres!)
                }
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }

        }
        
//        PlanetRequest.getAllPlanets(withURL: Constants.APIUrls.getAllPlanetsUrl) { (planetsResponse, error) in
//            if let allPlanets = planetsResponse {
//                //                self.response = allPlanets
//
//                if firstPage == true {
//                    self.response = allPlanets
//                }else {
//                    self.response?.next = allPlanets.next
//                    self.response?.previous = allPlanets.previous
//                    self.response?.count = allPlanets.count
//                    self.response?.results?.append(contentsOf: allPlanets.results!)
//                }
//            }
//
//            if let errorDetail = error {
//                completion(errorDetail)
//            }
//        }
    }
}
