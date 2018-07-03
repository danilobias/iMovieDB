//
//  Credits.swift
//
//  Created by Danilo Bias on 03/07/18
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Credits {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cast = "cast"
    static let crew = "crew"
  }

  // MARK: Properties
  public var cast: [Cast]?
  public var crew: [Crew]?

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
    if let items = json[SerializationKeys.cast].array { cast = items.map { Cast(json: $0) } }
    if let items = json[SerializationKeys.crew].array { crew = items.map { Crew(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cast { dictionary[SerializationKeys.cast] = value.map { $0.dictionaryRepresentation() } }
    if let value = crew { dictionary[SerializationKeys.crew] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
