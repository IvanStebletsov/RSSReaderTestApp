//
//  NetworkingServiceProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol Networking: class {
    
    func fetchData(from url: String, completion: @escaping ((Result<Data, DataResponseError>, URLResponse?) -> ()))
    
}
