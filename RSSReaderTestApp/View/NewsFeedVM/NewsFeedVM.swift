//
//  NewsFeedVM.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class NewsFeedVM: NewsFeedVMProtocol {
    
    //MARK: - Properties
    var networkService: Networking!
    var dataStorage: DataStorage!
    var parser: DataParser!
    let urls = ["https://www.gazeta.ru/export/rss/lenta.xml", "http://lenta.ru/rss"]
    var fetchedNews = [News]()
    let operationQueue = OperationQueue()
    
    // MARK: - Initialization
    init(networkService: Networking, dataStorageService: DataStorage, parserService: DataParser) {
        self.networkService = networkService
        self.dataStorage = dataStorageService
        self.parser = parserService
    }
    
    // MARK: - NewsFeedVMProtocol methods
    func numberOfRows() -> Int {
        return dataStorage.retrieveCountStoredElements()
    }
    
    func fetchData(_ completion: @escaping (DataResponseError?) -> ()) {
        fetchedNews.removeAll()
        
        for url in urls {
            let fetchOperation = FetchOperation(url: url, networkService: networkService)
            fetchOperation.completionBlock = { [weak self] in
                guard let self = self, let result = fetchOperation.result?.0 else { return }
                switch result {
                case .success(let data):
                    self.parser.parseNews(from: data, completion: { (news) in
                        self.fetchedNews += news
                        self.dataStorage.saveData(self.fetchedNews)
                        completion(nil)
                    })
                case .failure(.network):
                    print(result)
                    completion(DataResponseError.network)
                case .failure(.connection):
                    print(result)
                    completion(DataResponseError.connection)
                }
            }
            operationQueue.addOperation(fetchOperation)
        }
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> NewsTVCellVM {
        return NewsTVCellVM(news: dataStorage.dataFor(indexPath), networkService: networkService, dataStorage: dataStorage)
    }
    
}
