//
//  Error+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

extension Error {
    
    var isDecodingError: Bool { self is DecodingError }

    func printDecodingError() {
        #if DEBUG
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        print("ℹ️ Got ❌DECODING❌ error:")
        print("\(self)")
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        #endif
    }
}
