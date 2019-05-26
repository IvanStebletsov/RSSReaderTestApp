//
//  NewsTests.swift
//  RSSReaderTestAppTests
//
//  Created by Ivan Stebletsov on 26/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import RSSReaderTestApp

class NewsTests: XCTestCase {
    
    func testNewsObjectCanBeInstantiated() {
        let news = News(title: "Title", description: "News description", pubDate: Date(), imageUrl: "http://icdn.lenta.ru/images/2019/05/24/19/20190524192919522/pic_f095fede71102c74afcfc56664d0e67c.jpg")
        
        XCTAssertNotNil(news, "News object can not be instantiated")
    }
    
}
