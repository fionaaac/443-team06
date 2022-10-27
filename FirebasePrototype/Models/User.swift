//
//  User.swift
//  FirebasePrototype
//
//  Created by Kimberly Gao on 10/26/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var username: String
  var name: String
  var email: String
  var password: String
  var profilePicture: Bool
  var friends: [String]
  var memories: [Int]
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case username
    case email
    case password
    case profilePicture = "profile-picture"
    case friends
    case memories
  }
  
}
