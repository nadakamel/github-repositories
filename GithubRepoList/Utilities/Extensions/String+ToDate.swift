//
//  String+ToDate.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 11/06/2021.
//

import Foundation

extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return nil }
        return date
    }
}
