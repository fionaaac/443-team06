//
//  Location.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Location: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String
  var address: String
  var city: String
  var longitude: Int
  var name: String
  
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case address
    case city
    case longitude
    case name
  }
  
}
