//
//  PromptRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class PromptRepository: ObservableObject {
  private let path: String = "prompt"
  private let store = Firestore.firestore()

  @Published var prompts: [Prompt] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting prompts: \(error.localizedDescription)")
          return
        }

        self.prompts = querySnapshot?.documents.compactMap { document in
          try? document.data(as: Prompt.self)
        } ?? []
        print("hi")
        print(self.prompts)
      }
  }
}
