//
//  Date+FormattedString.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String = "E MMM dd yyyy HH:mm:ss ZZZZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM dd yyyy HH:mm:ss ZZZZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: self)
        return "\(dateString)+0000 (UTC)"
    }
    
    func toMonthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func toFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: self)
        let myDate = formatter.date(from: dateString)
        formatter.dateFormat = "MMMM dd, yyyy"
        var myDateString = formatter.string(from: myDate!)
        formatter.dateFormat = "hh:mm a"
        let myTimeString = formatter.string(from: myDate!)
        if isInSameYear() {
            formatter.dateFormat = "MMMM dd"
            myDateString = formatter.string(from: myDate!)
            if isToday() {
                return "Today at \(myTimeString)"
            } else if isYesterday() {
                return "Yesterday at \(myTimeString)"
            } else if isInThisWeek() {
                formatter.dateFormat = "EEEE"
                myDateString = formatter.string(from: myDate!)
            }
        }
        return "\(myDateString) at \(myTimeString)"
    }
    
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func isYesterday() -> Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    func isInThisWeek() -> Bool {
        let currentComponents = Calendar.current.dateComponents([.weekOfYear], from: Date())
        let dateComponents = Calendar.current.dateComponents([.weekOfYear], from: self)
        guard let currentWeekOfYear = currentComponents.weekOfYear, let dateWeekOfYear = dateComponents.weekOfYear else { return false }
        return currentWeekOfYear == dateWeekOfYear
    }
    
    func isInSameYear() -> Bool {
        return Calendar.current.isDate(self, equalTo: self, toGranularity: .year)
    }
}
