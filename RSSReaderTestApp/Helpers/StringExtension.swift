//
//  StringExtension.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 25/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

enum ConvertionError: Error {
    case invalidData
}

extension String {
    func convertToDate() throws -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 3600 * 3)
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        
        guard let date = dateFormatter.date(from: self) else { throw ConvertionError.invalidData }
        return date
    }
}
