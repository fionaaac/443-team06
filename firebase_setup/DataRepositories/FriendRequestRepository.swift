//
//  FriendRequestRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class FriendRequestRepository: ObservableObject {
  private let path: String = "friend-request"
  private let store = Firestore.firestore()

  @Published var friendRequests: [FriendRequest] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting friendRequests: \(error.localizedDescription)")
          return
        }

        self.friendRequests = querySnapshot?.documents.compactMap { document in
          try? document.data(as: FriendRequest.self)
        } ?? []
        print("hi")
        print(self.friendRequests)
      }
  }
}
