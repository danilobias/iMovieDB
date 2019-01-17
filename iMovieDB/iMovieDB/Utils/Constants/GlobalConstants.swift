//
//  Constants.swift
//  SWAPP
//
//  Created by Danilo Bias on 16/03/18.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import Foundation

struct Constants {
    
    //MARK: URL's e métodos
    struct APIPreffix {
        static let urlPreffix: String = "https://api.themoviedb.org/3/"
        static let imageUrlPreffix: String = "https://image.tmdb.org/t/p/original/"
    }
    
    struct APIKeys {
        static let apiKey: String = "api_key=0926f45f96279de33082774d572573c0"
    }
    
    struct URLPaths {
        static let commonPath = "/"
        static let concatKey = "&"
    }
    
    struct moviesMethods {
        static let getAllMethod = "/films"
        static let getDetailsMethod = Constants.moviesMethods.getAllMethod + Constants.URLPaths.commonPath
    }
    
    struct GenresMethods {
        static let getAllMethod: String = "genre/movie/list?"
        static let getMovieByGenreMethod: String = "genre/%@/movies?"
    }
    
    struct Segues {
        static let showMovieDetails: String = "ShowMovieDetailsPush"
    }
    
    struct SortMethods {
        static let orderByCreatedAtAsc: String = "sort_by=created_at.asc"
    }

    struct APIUrls {
        
        static let getAllGenres = Constants.APIPreffix.urlPreffix + GenresMethods.getAllMethod + Constants.URLPaths.concatKey + Constants.SortMethods.orderByCreatedAtAsc + Constants.URLPaths.concatKey + Constants.APIKeys.apiKey
        
        static let getMovieByGenre = Constants.APIPreffix.urlPreffix + GenresMethods.getMovieByGenreMethod + Constants.SortMethods.orderByCreatedAtAsc + Constants.URLPaths.concatKey + Constants.APIKeys.apiKey
    }
}
