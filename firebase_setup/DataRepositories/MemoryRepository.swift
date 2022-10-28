//
//  MemoryRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class MemoryRepository: ObservableObject {
  private let path: String = "memory"
  private let store = Firestore.firestore()

  @Published var memories: [Memory] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting memories: \(error.localizedDescription)")
          return
        }

        self.memories = querySnapshot?.documents.compactMap { document in
          try? document.data(as: Memory.self)
        } ?? []
        print("hi")
        print(self.memories)
      }
  }
}
