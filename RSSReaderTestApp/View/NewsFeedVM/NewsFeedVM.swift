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
    let parser = ParseService()
    let urls = ["https://www.gazeta.ru/export/rss/lenta.xml", "http://lenta.ru/rss"]
    var fetchedNews = [News]()
    var iterations = 0
    
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
        dataStorage.resetData()
        fetchedNews.removeAll()
        iterations = 0
        
        for url in urls {
            networkService.fetchData(from: url) { [weak self] (result, response) in
                guard let self = self else { return }
                
                switch result {
                case .success(let data):
                    self.parser.parseNews(from: data, completion: { [weak self] (news) in
                        guard let self = self else { return }

                        self.fetchedNews += news
                        self.dataStorage.saveData(self.fetchedNews)
                        
                        if self.iterations != 0 {
                            completion(nil)
                        } else {
                            self.iterations += 1
                        }
                    })
                case .failure(.network):
                    completion(DataResponseError.network)
                case .failure(.connection):
                    completion(DataResponseError.connection)
                }
            }
        }
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> NewsTVCellVM {
        return NewsTVCellVM(news: dataStorage.dataFor(indexPath), networkService: networkService)
    }
    
}
