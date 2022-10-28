//
//  DailyPrompt.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
import FirebaseFirestoreSwift

struct DailyPrompt: Identifiable, Codable {
    
  // MARK: Fields
  var prompt_id: Int
  @DocumentID var username : String
  var requester: String
  
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case prompt_id = "prompt"
    case username
  }
  
}
