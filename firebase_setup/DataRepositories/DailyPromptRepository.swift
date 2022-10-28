//
//  DailyPromptRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class DailyPromptRepository: ObservableObject {
  private let path: String = "daily-prompt"
  private let store = Firestore.firestore()

  @Published var dailyPrompts: [DailyPrompt] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting dailyPrompts: \(error.localizedDescription)")
          return
        }

        self.dailyPrompts = querySnapshot?.documents.compactMap { document in
          try? document.data(as: DailyPrompt.self)
        } ?? []
        print("hi")
        print(self.dailyPrompts)
      }
  }
}
