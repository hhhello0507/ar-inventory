//
//  InventoryTrackerVisionApp.swift
//  InventoryTrackerVision
//
//  Created by dgsw8th71 on 2/18/24.
//

import SwiftUI

@main
struct InventoryTrackerVisionApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var navVM = NavigationVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                InventoryListView()
                    .environment(navVM)
            }
        }
        
        WindowGroup(id: "item") {
            InventoryItemView()
                .environment(navVM)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 1, depth: 1, in: .meters)
    }
}
