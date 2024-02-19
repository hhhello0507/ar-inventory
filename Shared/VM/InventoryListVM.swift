//
//  InventoryVM.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/18/24.
//

import Foundation
import Observation
import SwiftUI
import FirebaseFirestore

@Observable
final class InventoryListVM {
    var items = [InventoryItem]()
    
    @MainActor
    func listenToItems() {
        Firestore.firestore().collection("items")
            .order(by: "name")
            .limit(toLast: 100)
            .addSnapshotListener { snapshot, error in
                guard let snapshot else {
                    print("InventoryListVM - \(error?.localizedDescription ?? "error")")
                    return
                }
                let docs = snapshot.documents
                let items = docs.compactMap {
                    try? $0.data(as: InventoryItem.self)
                }
                withAnimation {
                    self.items = items
                }
            }
    }
}
