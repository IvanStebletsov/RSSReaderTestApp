//
//  NewsTVCellVMTests.swift
//  RSSReaderTestAppTests
//
//  Created by Ivan Stebletsov on 27/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import RSSReaderTestApp

class NewsTVCellVMTests: XCTestCase {
    
    private var newsTVCellVM: NewsTVCellVMProtocol!
    private var networkService: Networking!
    private var dataStorage: DataStorage!
    private var news: News!
    
    override func setUp() {
        networkService = NetworkService()
        dataStorage = DataStorageService()
        news = News(title: "Title", description: "News description", pubDate: Date(), imageUrl: "http://icdn.lenta.ru/images/2019/05/24/19/20190524192919522/pic_f095fede71102c74afcfc56664d0e67c.jpg")
        newsTVCellVM = NewsTVCellVM(news: news, networkService: networkService, dataStorage: dataStorage)
        
    }
    
    override func tearDown() {
        newsTVCellVM = nil
        networkService = nil
        news = nil
        super.tearDown()
    }
    
    func testNewsTVCellVMCanBeInstantiated() {
        XCTAssertNotNil(newsTVCellVM, "NewsTVCellVM can not be instantiated")
    }
    
    func testNewsTVCellVMCanRetrievePublisher() {
        let publisher = newsTVCellVM.publisher()
        
        XCTAssertEqual(publisher, "Lenta.ru", "NewsTVCellVM can not retrieve publisher")
    }
    
    func testNewsTVCellVMCanRetrievePubTime() {
        let pubDate = newsTVCellVM.pubTime()
       
        XCTAssertEqual(pubDate, "сейчас", "NewsTVCellVM can not retrieve pubDate")
    }
    
    func testNewsTVCellVMCanRetrieveTitle() {
        let title = newsTVCellVM.title()
        
        XCTAssertEqual(title, "Title", "NewsTVCellVM can not retrieve title")
    }
    
    func testNewsTVCellVMCanRetrieveDescription() {
        let description = newsTVCellVM.description()
        
        XCTAssertEqual(description, "News description", "NewsTVCellVM can not retrieve description")
    }
    
}
