//
//  NewsFeedVMProtocol.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol NewsFeedVMProtocol: class {
    
    func fetchData(_ completion: @escaping (DataResponseError?) -> ())
    
    func numberOfRows() -> Int
    
    func viewModelForCell(at indexPath: IndexPath) -> NewsTVCellVM
    
}
