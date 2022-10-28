//
//  LocationRepository.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import Foundation
//import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class LocationRepository: ObservableObject {
  private let path: String = "location"
  private let store = Firestore.firestore()

  @Published var locations: [Location] = []
//  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting locations: \(error.localizedDescription)")
          return
        }

        self.locations = querySnapshot?.documents.compactMap { document in
          try? document.data(as: Location.self)
        } ?? []
        print("hi")
        print(self.locations)
      }
  }
}
