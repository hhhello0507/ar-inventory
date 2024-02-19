//
//  NavigationVM.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/19/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
final class NavigationVM {
    
    var selectedItem: InventoryItem?
    
    init(selectedItem: InventoryItem? = nil) {
        self.selectedItem = selectedItem
    }
    
}
