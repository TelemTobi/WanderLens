//
//  Data+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

extension Data {
    
    var jsonDictionary: JsonDictionary? {
        try? JSONSerialization.jsonObject(with: self, options: []) as? JsonDictionary
    }
    
    var prettyPrintedJSON: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
              let prettyPrintedJSON = String(data: data, encoding: .utf8) else { return nil }
        return prettyPrintedJSON
    }
    
    func parse<T: Codable>(type: T.Type, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = .iso8601, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> T {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
        
        if let dateDecodingStrategy = dateDecodingStrategy {
            jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
        }
        
        return try jsonDecoder.decode(type, from: self)
    }
}
