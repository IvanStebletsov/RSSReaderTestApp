//
//  DataStorageService.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 24/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class DataStorageService: DataStorage {
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    private var data = [News]() {
        didSet {
            data = data.sorted(by: { (news1, news2) -> Bool in news1.pubDate > news2.pubDate })
        }
    }
    
    func saveData(_ data: [News]) {
        self.data = data
    }
    
    func retrieveCountStoredElements() -> Int {
        return data.count
    }
    
    func dataFor(_ indexPath: IndexPath) -> News {
        return data[indexPath.row]
    }
    
    func resetData() {
        data.removeAll()
    }
    
    func cacheImage(data: Data, for key: String) {
        let key = key as AnyObject
        imageCache.setObject(data as AnyObject, forKey: key)
    }
    
    func retrieveImageFromCache(for key: String) -> Data? {
        let key = key as AnyObject
        return imageCache.object(forKey: key) as? Data
    }
    
}
