//
//  ParseService.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 24/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class ParseService: NSObject, DataParser {
    
    // MARK: - Properties
    private var newsItems = [News]()
    private var currentElement = ""
    private var currentTitle = "" { didSet { currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.newlines) } }
    private var currentDescription = "" { didSet { currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) } }
    private var currentPubDate = "" { didSet { currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) } }
    private var currentImage = ""
    
    // MARK: - Methods
    func parseNews(from data: Data, completion: @escaping (([News]) -> ())) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        
        completion(newsItems)
        newsItems.removeAll()
    }
}

extension ParseService: XMLParserDelegate {
    
    // MARK: - XMLParserDelegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        switch currentElement {
        case NewsElements.item.rawValue:
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
            currentImage = ""
        case NewsElements.enclosure.rawValue:
            if let url = attributeDict[NewsElements.image.rawValue] {
                currentImage = url
            }
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case NewsElements.title.rawValue:
            currentTitle += string
        case NewsElements.description.rawValue:
            currentDescription += string
        case NewsElements.pubDate.rawValue:
            currentPubDate += string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == NewsElements.item.rawValue {
            if let date = try? currentPubDate.convertToDate() {
                let news = News(title: currentTitle, description: currentDescription, pubDate: date, imageUrl: currentImage)
                newsItems.append(news)
            } else {
                let news = News(title: currentTitle, description: currentDescription, pubDate: Date(), imageUrl: currentImage)
                newsItems.append(news)
            }
        }
    }
}
