//
//  DateTimeService.swift
//  Tiny
//
//  Created by halab on 6/9/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct DateTimeService {
    
    static func currentTime() -> Int64 {
        return Int64((Date().timeIntervalSince1970 * 1000).rounded())
    }
    
    static func toDate(_ timestamp : Int64) -> Date{
        return Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))
    }
    
    static func toDateString(_ timestamp : Int64) -> String {
        let date = toDate(timestamp)
        return format(date: date, format: DateTimeFormat.DD_MM_YYYY)
    }
    
    private static func format(date : Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        //dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
