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
        static var urlPreffix: String = "https://api.themoviedb.org/3/"
    }
    
    struct APIKeys {
        static var apiKey: String = "api_key=0926f45f96279de33082774d572573c0"
    }
    
    struct URLPaths {
        static let commonPath = "/"
        static let concatKey = "&"
    }
    
    struct moviesMethods {
        static let getAllMethod = "/films"
        static let getDetailsMethod = Constants.moviesMethods.getAllMethod + Constants.URLPaths.commonPath
    }
    
    struct PeopleMethods {
        static let getAllMethod = "/people"
        static let getDetailsMethod = Constants.PeopleMethods.getAllMethod + Constants.URLPaths.commonPath
    }

    struct StarshipsMethods {
        static let getAllMethod = "/starships"
        static let getDetailsMethod = Constants.StarshipsMethods.getAllMethod + Constants.URLPaths.commonPath
    }

    struct VehiclesMethods {
        static let getAllMethod = "/vehicles"
        static let getDetailsMethod = Constants.VehiclesMethods.getAllMethod + Constants.URLPaths.commonPath
    }

    struct SpeciesMethods {
        static let getAllMethod = "/species"
        static let getDetailsMethod = Constants.SpeciesMethods.getAllMethod + Constants.URLPaths.commonPath
    }

    struct GenresMethods {
        static let getAllMethod = "genre/movie/list?&sort_by=created_at.asc"
        static let getDetailsMethod = Constants.GenresMethods.getAllMethod + Constants.URLPaths.commonPath
    }


    struct APIUrls {
        
//        static let getAllFilmsUrl = Constants.APIPreffix.urlPreffix + moviesMethods.getAllMethod
//        static let getFilmDetailsUrl = Constants.APIPreffix.urlPreffix + moviesMethods.getDetailsMethod
//
//        static let getAllPeopleUrl = Constants.APIPreffix.urlPreffix + PeopleMethods.getAllMethod
//        static let getPeopleDetailsUrl = Constants.APIPreffix.urlPreffix + PeopleMethods.getDetailsMethod
//
//        static let getAllStarshipsUrl = Constants.APIPreffix.urlPreffix + StarshipsMethods.getAllMethod
//        static let getStarshipDetailsUrl = Constants.APIPreffix.urlPreffix + StarshipsMethods.getDetailsMethod
//
//        static let getAllVehiclesUrl = Constants.APIPreffix.urlPreffix + VehiclesMethods.getAllMethod
//        static let getVehicleDetailsUrl = Constants.APIPreffix.urlPreffix + VehiclesMethods.getDetailsMethod
//
//        static let getAllSpeciesUrl = Constants.APIPreffix.urlPreffix + SpeciesMethods.getAllMethod
//        static let getSpeciesDetailsUrl = Constants.APIPreffix.urlPreffix + SpeciesMethods.getDetailsMethod

        static let getAllGenres = Constants.APIPreffix.urlPreffix + GenresMethods.getAllMethod + Constants.URLPaths.concatKey + Constants.APIKeys.apiKey
        static let getPlanetDetailsUrl = Constants.APIPreffix.urlPreffix + GenresMethods.getDetailsMethod
        
    }
}
