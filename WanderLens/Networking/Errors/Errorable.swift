//
//  Errorable.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

protocol Errorable: Error, Codable, JsonResolver {
    var debugDescription: String { get }
    init(errorType: PredefinedError?)
}
