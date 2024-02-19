//
//  String+Ext.swift
//  InventoryTracker
//
//  Created by dgsw8th71 on 2/18/24.
//

import Foundation

extension String: Error, LocalizedError {
    
    public var errorDescription: String? { self }
    
}
