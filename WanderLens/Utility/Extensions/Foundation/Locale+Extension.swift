//
//  Locale+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

extension Locale {
    
    enum SupportedLocale: String {
        case english = "en_US"
        case hebrew = "he_IL"
        case french = "fr_FR"
        case german = "de_DE"

        var locale: Locale {
            return Locale(identifier: self.rawValue)
        }
    }
}
