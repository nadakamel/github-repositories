//
//  Date+FormattedString.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: self)
        return "\(dateString)+0000 (UTC)"
    }

    func toFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = formatter.string(from: self)
        let myDate = formatter.date(from: dateString)
        
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        var myDateString = formatter.string(from: myDate!)
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: myDate!)
        let yearDiff = Int(formatter.string(from: Date()))! - Int(year)!
        print(yearDiff)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: myDate!)
        let monthDiff = Int(formatter.string(from: Date()))! - Int(month)!
        print(monthDiff)
        
        if yearDiff > 1 {
            myDateString = "\(yearDiff) years ago"
        } else if monthDiff > 6 {
            myDateString = "\(monthDiff) month ago"
        }
        return "\(myDateString)"
    }
}
