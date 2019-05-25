//
//  DataStorageProtocol.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 24/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol DataStorage {
    
    func saveData(_ data: [News])
    
    func retrieveCountStoredElements() -> Int
    
    func dataFor(_ indexPath: IndexPath) -> News
    
    func resetData()
}
