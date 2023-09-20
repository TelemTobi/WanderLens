//
//  Encodable+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 20/09/2023.
//

import Foundation

extension Encodable {
 
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
