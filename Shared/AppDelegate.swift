//
//  AppDelegate.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/18/24.
//

import Foundation
import UIKit

import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // 로컬일때
        setupFirebaseLocalEmulator()
        return true
    }
    
    func setupFirebaseLocalEmulator() {
//        var host = "127.0.0.1"
//        #if !targetEnvironment(simulator)
//        host = "172.30.1.85"
//        #endif
//        
//        let settings = Firestore.firestore().settings
//        settings.host = "\(host):8080"
//        settings.cacheSettings = MemoryCacheSettings()
//        settings.isSSLEnabled = false
//        Firestore.firestore().settings = settings
//        
//        Storage.storage().useEmulator(withHost: "gs://inventorytracker-54e0a.appspot.com", port: 9199)
    }
}
