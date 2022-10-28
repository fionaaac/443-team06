//
//  Memory.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Memory: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: Int
  var back: String
  var front: String
  var caption: String
  var latitude: Int
  var location: String
  var timestamp: ip_timestamp
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case back
    case front
    case caption
    case location
    case username
    case timestamp
  }
  
}
