//
//  NewsFeedVMTests.swift
//  RSSReaderTestAppTests
//
//  Created by Ivan Stebletsov on 26/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import RSSReaderTestApp

class NewsFeedVMTests: XCTestCase {
    
    private var newsFeedVM: NewsFeedVMProtocol!
    private var networkService: Networking!
    private var dataStorageService: DataStorageService!
    private var dataParser: DataParser!

    override func setUp() {
        networkService = NetworkService()
        dataStorageService = DataStorageService()
        dataParser = ParseService()
        
        newsFeedVM = NewsFeedVM(networkService: networkService, dataStorageService: dataStorageService, parserService: dataParser)
    }
    
    override func tearDown() {
        newsFeedVM = nil
        networkService = nil
        dataStorageService = nil
        super.tearDown()
    }

    func testNewsFeedVMCanBeInstantiated() {
        XCTAssertNotNil(newsFeedVM, "NewsFeedVM can not be instantiated")
    }

    func testNewsFeedVMCanRetrieveNumberOfRows() {
        let numberOfRows = newsFeedVM.numberOfRows()

        XCTAssertEqual(numberOfRows, 0, "NewsFeedVM does not retriev number of rows for tableView")
    }

    func testNewsFeedVMCanRetrieveViewModelForTableViewCell() {
        let news = News(title: "Title", description: "News description", pubDate: Date(), imageUrl: "http://icdn.lenta.ru/images/2019/05/24/19/20190524192919522/pic_f095fede71102c74afcfc56664d0e67c.jpg")
        dataStorageService.saveData([news])
        let indexPathForRow = IndexPath(row: 0, section: 0)
        let viewModelForCell = newsFeedVM.viewModelForCell(at: indexPathForRow)
        
        XCTAssertNotNil(viewModelForCell, "NewsFeedVM can not be retrieve viewModel for TableViewCell")
    }

}
