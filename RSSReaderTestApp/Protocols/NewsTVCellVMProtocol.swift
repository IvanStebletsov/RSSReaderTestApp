//
//  NewsTVCellVMProtocol.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 25/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol NewsTVCellVMProtocol {
    
    func publisherImage()
    
    func publisher() -> String
    
    func newsImage(_ completion: @escaping (Data?) -> ())
    
    func pubTime() -> String
    
    func title() -> String
    
    func description() -> String
    
}
