//
//  Int+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

extension Int {
    
    var zero: Int { 0 }
    
    var isError: Bool { return self >= 400 || self == 203 || self == 207 }
}
