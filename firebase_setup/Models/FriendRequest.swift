//
//  FriendRequest.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
import FirebaseFirestoreSwift

struct FriendRequest: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: Int
  var receiver: String
  var requester: String
  
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case receiver
    case requester
  }
  
}
