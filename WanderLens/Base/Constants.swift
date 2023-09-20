//
//  Constants.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import SwiftUI

// MARK: -  Typealias

typealias Parsable = Decodable & JsonResolver
typealias JsonDictionary = [String: Any]
typealias DateFormat = Date.DateFormat

// MARK: - Completions

typealias SuccessCompletion = (_ success: Bool) -> Void
typealias EmptyCompletion = () -> Void

typealias PhotosSearchCompletion = (PhotosSearchResponse?, Errorable?)
typealias CollectionsSearchCompletion = (CollectionsSearchResponse?, Errorable?)
typealias UsersSearchCompletion = (UsersSearchResponse?, Errorable?)

// MARK: - Contstants

enum Constants {
    
    enum TimeInterval {
        static let stubDelay: Double = 0.2
    }
}
