//
//  Cast.swift
//
//  Created by Danilo Bias on 03/07/18
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Cast {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let profilePath = "profile_path"
    static let castId = "cast_id"
    static let character = "character"
    static let id = "id"
    static let gender = "gender"
    static let creditId = "credit_id"
    static let order = "order"
  }

  // MARK: Properties
  public var name: String?
  public var profilePath: String?
  public var castId: Int?
  public var character: String?
  public var id: Int?
  public var gender: Int?
  public var creditId: String?
  public var order: Int?

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
    name = json[SerializationKeys.name].string
    profilePath = json[SerializationKeys.profilePath].string
    castId = json[SerializationKeys.castId].int
    character = json[SerializationKeys.character].string
    id = json[SerializationKeys.id].int
    gender = json[SerializationKeys.gender].int
    creditId = json[SerializationKeys.creditId].string
    order = json[SerializationKeys.order].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = profilePath { dictionary[SerializationKeys.profilePath] = value }
    if let value = castId { dictionary[SerializationKeys.castId] = value }
    if let value = character { dictionary[SerializationKeys.character] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    if let value = creditId { dictionary[SerializationKeys.creditId] = value }
    if let value = order { dictionary[SerializationKeys.order] = value }
    return dictionary
  }

}
