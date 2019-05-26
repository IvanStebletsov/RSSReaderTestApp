//
//  News.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 24/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

struct News {
    var publisher: String { return imageUrl.contains("gazeta.ru") ? "Газета.ru" : "Lenta.ru" }
    var title: String
    var description: String
    var pubDate: Date
    var imageUrl: String
    
    init(title: String, description: String, pubDate: Date, imageUrl: String) {
        self.title = title
        self.description = description
        self.pubDate = pubDate
        self.imageUrl = imageUrl
    }
}
