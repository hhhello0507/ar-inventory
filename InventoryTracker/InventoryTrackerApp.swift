//
//  InventoryTrackerApp.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/18/24.
//

import SwiftUI

@main
struct InventoryTrackerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                InventoryListView()
                    .environment(navVM)
            }
        }
    }
}
