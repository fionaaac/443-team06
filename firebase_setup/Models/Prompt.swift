//
//  Prompt.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Prompt: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: Int
  var description: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case description
  }
  
}
