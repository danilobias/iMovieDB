//
//  GenresRequest.swift
//  iMovieDB
//
//  Created by Danilo Bias on 03/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit
import SwiftyJSON

class GenresRequest: NSObject {

    static func getAllGenres(withURL url: String, completion: @escaping(GenreResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                print("ALL GENRES \(JSON(data))")
                let json: JSON = JSON(data)
                let genreResponse: GenreResponse = GenreResponse(json: json)
                completion(genreResponse, nil)

            }else if let error = result as? Error {
                completion(nil, error)
            }else{
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
    
    static func getMoviesByGenre(withURL url: String, completion: @escaping(MoviesByGenreResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let moviesByGenreResponse: MoviesByGenreResponse = MoviesByGenreResponse(json: json)
                completion(moviesByGenreResponse, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }else{
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}
