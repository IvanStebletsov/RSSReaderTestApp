//
//  ParseOperation.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 26/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class ParseOperation: Operation {
    
    private var data: Data!
    let parser = ParseService()
    var news = [News]()
    
    init(data: Data) {
        self.data = data
    }
    
    override func main() {
        parser.parseNews(from: data) { [weak self] (news) in
            guard let self = self else { return }
            self.news = news
        }
    }
    
}
