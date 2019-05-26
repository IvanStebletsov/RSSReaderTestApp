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
    let urls = ["https://www.gazeta.ru/export/rss/lenta.xml", "http://lenta.ru/rss"]
    var fetchedNews = [News]()
    let operationQueue = OperationQueue()
    
    // MARK: - Initialization
    init(networkService: Networking, dataStorageService: DataStorage) {
        self.networkService = networkService
        self.dataStorage = dataStorageService
    }
    
    // MARK: - NewsFeedVMProtocol methods
    func numberOfRows() -> Int {
        return dataStorage.retrieveCountStoredElements()
    }
    
    func fetchData(_ completion: @escaping (DataResponseError?) -> ()) {
        fetchedNews.removeAll()
        
        for url in urls {
            let fetchOperation = FetchOperation(url: url, networkService: self.networkService)
            fetchOperation.completionBlock = { [weak self] in
                guard let self = self, let result = fetchOperation.result?.0 else { return }
                switch result {
                case .success(let data):
                    let parseOperation = ParseOperation(data: data)
                    parseOperation.completionBlock = {
                        self.fetchedNews += parseOperation.news
                        self.dataStorage.saveData(self.fetchedNews)
                        completion(nil)
                    }
                    sleep(1)
                    self.operationQueue.addOperation(parseOperation)
                case .failure(.network):
                    completion(DataResponseError.network)
                case .failure(.connection):
                    completion(DataResponseError.connection)
                }
            }
            operationQueue.addOperation(fetchOperation)
        }
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> NewsTVCellVM {
        return NewsTVCellVM(news: dataStorage.dataFor(indexPath), networkService: networkService)
    }
    
}
