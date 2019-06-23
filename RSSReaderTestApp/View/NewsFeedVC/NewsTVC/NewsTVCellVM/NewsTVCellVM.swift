//
//  NewsTVCellVM.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 25/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTVCellVM: NewsTVCellVMProtocol {
    
    // MARK: - Properties
    var news: News
    var networkService: Networking!
    var dataStorage: DataStorage!
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    // MARK: - Initialization
    init(news: News, networkService: Networking!, dataStorage: DataStorage) {
        self.news = news
        self.networkService = networkService
        self.dataStorage = dataStorage
    }

    // MARK: - NewsTVCellVMProtocol methods
    func publisher() -> String {
        return news.publisher
    }
    
    func imageUrl() -> String {
        return news.imageUrl
    }
    
    func newsImage(_ completion: @escaping (Data?) -> ()) {
        if let imageFromCache = self.dataStorage.retrieveImageFromCache(for: self.news.imageUrl) {
            completion(imageFromCache)
            return
        }
        
        networkService.fetchData(from: news.imageUrl) { (result, response) in
            switch result {
            case .success(let data):
                self.dataStorage.cacheImage(data: data, for: self.news.imageUrl)
                completion(data)
            case .failure(.network):
                print(DataResponseError.network)
            case .failure(.connection):
                print(DataResponseError.connection)
            }
        }
    }
    
    func pubTime() -> String {
        let now = Date()
        switch news.pubDate.minutes(from: now) {
        case 0..<5:
            return "сейчас"
        case 5..<60:
            return "\(news.pubDate.minutes(from: now)) минут назад"
        case 60..<120:
            return "час назад"
        case 120..<180:
            return "2 часа назад"
        case 180..<240:
            return "3 часа назад"
        case 240..<300:
            return "4 часа назад"
        case 300..<360:
            return "5 часов назад"
        case 360..<420:
            return "Более 5 часов назад"
        default:
            return news.pubDate.dateToString()
        }
    }
    
    func title() -> String {
        return news.title
    }
    
    func description() -> String {
        return news.description
    }
}
