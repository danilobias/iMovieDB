//
//  MoviesByGenreResponse.swift
//
//  Created by Danilo Bias on 03/07/18
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MoviesByGenreResponse {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let totalPages = "total_pages"
        static let page = "page"
        static let id = "id"
        static let results = "results"
        static let totalResults = "total_results"
    }
    
    // MARK: Properties
    public var totalPages: Int?
    public var page: Int?
    public var id: Int?
    public var movies: [MovieByGenre]?
    public var totalResults: Int?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        totalPages = json[SerializationKeys.totalPages].int
        page = json[SerializationKeys.page].int
        id = json[SerializationKeys.id].int
        if let items = json[SerializationKeys.results].array { movies = items.map { MovieByGenre(json: $0) } }
        totalResults = json[SerializationKeys.totalResults].int
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = totalPages { dictionary[SerializationKeys.totalPages] = value }
        if let value = page { dictionary[SerializationKeys.page] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = movies { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
        if let value = totalResults { dictionary[SerializationKeys.totalResults] = value }
        return dictionary
    }
    
}
