//
//  FirebasePrototypeApp.swift
//  FirebasePrototype
//
//  Created by Kimberly Gao on 10/26/22.
//

import SwiftUI
import UIKit
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FirebasePrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

