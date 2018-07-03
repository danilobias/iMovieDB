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

                let json = JSON(data)
                let genreResponse = GenreResponse(json: json)
                completion(genreResponse, nil)

            }else if let error = result as? Error {
                completion(nil, error)
            }else{
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}
