//
//  Date+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import Foundation

extension Date {
    
    enum DateFormat: String {
        case dMMMyyyy = "d MMM yyyy"
        case yyyyMMddHypen = "yyyy-MM-dd"
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    func description(withFormat format: DateFormat, locale: Locale.SupportedLocale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = locale.locale
        return dateFormatter.string(from: self)
    }
}
