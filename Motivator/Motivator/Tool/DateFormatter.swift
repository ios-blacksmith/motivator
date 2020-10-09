//
//  Formatter.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import Foundation

enum Formatter {
    
    static let usaClockDisplayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    static let dayDisplayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd LLLL yyyy"
        return formatter
    }()
    
    static func usaDisplayTimeFrom(date: Date) -> String? {
        return usaClockDisplayFormatter.string(from: date)
    }
    
    static func dayDisplayTimeFrom(date: Date) -> String? {
        return dayDisplayFormatter.string(from: date)
    }

}
