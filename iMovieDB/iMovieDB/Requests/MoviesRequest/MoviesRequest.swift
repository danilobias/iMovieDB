//
//  MoviesRequest.swift
//  iMovieDB
//
//  Created by Danilo on 03/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoviesRequest: NSObject {

    static func getMovieDetails(withURL url: String, completion: @escaping(MovieDetail?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let movieDetail: MovieDetail = MovieDetail(json: json)
                completion(movieDetail, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }else{
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }

}
