//
//  DataResponseError.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

enum DataResponseError: Error {
    case network
    case connection
    
    var reason: String {
        switch self {
        case .network:
            return "Oops... We can't retrieve data properly"
        case .connection:
            return "Ooops... We have some problems with Internet connection"
        }
    }
}
