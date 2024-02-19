//
//  InventoryItemVM.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/19/24.
//

import Foundation
import SwiftUI
import Observation
import FirebaseFirestore
import RealityKit
import FirebaseStorage

@Observable
final class InventoryItemVM {
    
    var item: InventoryItem?
    var usdzFileURL: URL?
    var entity: ModelEntity?
    
    var onItemDeleted: (() -> Void)? = nil
    
    func listenToItem(_ item: InventoryItem) {
        self.item = item
        Firestore.firestore().collection("items")
            .document(item.id)
            .addSnapshotListener { [weak self] snapshot, error in
                guard let self, let snapshot else {
                    print("InventoryItemVM - \(error?.localizedDescription ?? "error")")
                    return
                }
                
                if !snapshot.exists {
                    self.onItemDeleted?()
                    return
                }
                
                self.item = try? snapshot.data(as: InventoryItem.self)
            }
    }
    
    
    
    @MainActor
    func fetchFileURL(usdzURL: URL) async {
        guard let url = usdzURL.usdzFileCacheURL else { return }
        
        if let usdzFileURL, usdzFileURL.lastPathComponent == url.lastPathComponent {
            return
        }
        
        do {
            if !FileManager.default.fileExists(atPath: url.absoluteString) {
                _ = try await Storage.storage().reference(forURL: usdzURL.absoluteString)
                    .writeAsync(toFile: url)
            }
            let entity = try await ModelEntity(contentsOf: url)
            entity.name = item?.usdzURL?.absoluteString ?? ""
            entity.generateCollisionShapes(recursive: true)
            entity.components.set(InputTargetComponent())
            self.usdzFileURL = url
            self.entity = entity
        } catch {
            self.usdzFileURL = nil
            self.entity = nil
        }
    }
}
