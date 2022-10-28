//
//  ContentView.swift
//  firebase_setup
//
//  Created by Chloe Chan on 10/27/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject userRepository = UserRepository()
  @ObservedObject promptRepository = PromptRepository()
  @ObservedObject locationRepository = LocationRepository()
  @ObservedObject memoryRepository = MemoryRepository()
  @ObservedObject friendRequestRepository = FriendRequestRepository()
  @ObservedObject dailyPromptRepository = DailyPromptRepository()
    
  var body: some View {
      Button(action: userRepository.get)
      Spacer()
      Button(action: promptRepository.get)
      Spacer()
      Button(action: locationRepository.get)
      Spacer()
      Button(action: memoryRepository.get)
      Spacer()
      Button(action: friendRequestRepository.get)
      Spacer()
      Button(action: dailyPromptRepository.get)
      Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
