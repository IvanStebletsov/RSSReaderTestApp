//
//  ParserProtocol.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 24/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol DataParser: class {
    
    func parseNews(from data: Data, completion: @escaping (([News]) -> ()))
    
}
