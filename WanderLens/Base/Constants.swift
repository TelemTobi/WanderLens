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

typealias PhotosListCompletion = ([Photo]?, Errorable?) -> Void
typealias CollectionsListCompletion = ([PhotoCollection]?, Errorable?) -> Void

typealias PhotosSearchCompletion = (PhotosSearchResponse?, Errorable?) -> Void
typealias CollectionsSearchCompletion = (CollectionsSearchResponse?, Errorable?) -> Void
typealias UsersSearchCompletion = (UsersSearchResponse?, Errorable?) -> Void

// MARK: - Contstants

enum Constants {
    
    enum TimeInterval {
        static let stubDelay: Double = 0.2
    }
}
