//
//  FetchOperation.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 26/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class FetchOperation: AsyncOperation {
    
    private var url: String!
    private var networkService: Networking!
    var result: (Result<Data, DataResponseError>?, URLResponse?)?
    
    init(url: String, networkService: Networking) {
        self.url = url
        self.networkService = networkService
    }
    
    override func main() {
        networkService.fetchData(from: url) { [weak self] (fetchResult, fetchResponse) in
            guard let self = self else { return }
            self.result = (fetchResult, fetchResponse)
            self.state = .isFinished
        }
    }
}


class AsyncOperation: Operation {
    enum State: String {
        case isReady, isExecuting, isFinished
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    var state = State.isReady {
        willSet {
            willChangeValue(forKey: state.rawValue)
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    override var isExecuting: Bool {
        return state == .isExecuting
    }
    
    override var isFinished: Bool {
        return state == .isFinished
    }
    
    override func start() {
        guard !self.isCancelled else { state = .isFinished; return }
        
        main()
        state = .isExecuting
    }
    
    override func cancel() {
        super.cancel()
        state = .isFinished
    }
}
