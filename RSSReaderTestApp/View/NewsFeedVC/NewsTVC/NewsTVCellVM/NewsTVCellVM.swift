//
//  NewsTVCellVM.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 25/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class NewsTVCellVM: NewsTVCellVMProtocol {
    
    // MARK: - Properties
    var news: News
    var networkService: Networking!
    
    // MARK: - Initialization
    init(news: News, networkService: Networking!) {
        self.news = news
        self.networkService = networkService
    }

    // MARK: - NewsTVCellVMProtocol methods
    func publisher() -> String {
        return news.publisher
    }
    
    func newsImage(_ completion: @escaping (Data?) -> ()) {
        networkService.fetchData(from: news.imageUrl) { (result, response) in
            switch result {
            case .success(let data):
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
