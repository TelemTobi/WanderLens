//
//  JsonResolver.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

protocol JsonResolver {
    static func resolve(_ data: Data) throws -> Data
}

extension JsonResolver {
    static func resolve(_ data: Data) throws -> Data { data }
}
