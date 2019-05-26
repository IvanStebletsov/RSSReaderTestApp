//
//  DateExtension.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 25/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

extension Date {
    
    func hours(from date: Date) -> Int {
        let timeDifference = Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
        return -timeDifference
    }
    
    func minutes(from date: Date) -> Int {
        let timeDifference = Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
        return -timeDifference
    }
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 3600 * 3) // the desired timezone
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE, dd MMM HH:mm"
        
        return dateFormatter.string(from: self)
    }
    
}
