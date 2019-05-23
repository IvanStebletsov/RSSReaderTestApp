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
    
    // MARK: - Initialization
    init(networkService: Networking) {
        self.networkService = networkService
        
        print(#function, "Is NetworkService in ViewModel nil - ?", networkService == nil ? "Yes" : "No")
    }
    
    
}
