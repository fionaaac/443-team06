//
//  UserRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {
  private let path: String = "user"
  private let store = Firestore.firestore()

  @Published var users: [User] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting users: \(error.localizedDescription)")
          return
        }

        self.users = querySnapshot?.documents.compactMap { document in
          try? document.data(as: User.self)
        } ?? []
        print("hi")
        print(self.users)
      }
  }
}

//let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
//    guard let data = data else {
//      print("Error: No data to decode")
//      return
//    }
//
//    guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
//      print("Error: Couldn't decode data into a result")
//      return
//  }
//
//  print("Total Count: \(result.totalCount)")
//  print("---------------------------")
//
//  print("Repositories:")
//  for repo in result.repos {
//    print("- \(repo.name)")
//  }
//
//}
//
//task.resume()


