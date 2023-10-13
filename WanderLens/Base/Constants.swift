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

typealias PhotosListCompletion = (photos: [Photo]?, error: Errorable?)
typealias CollectionsListCompletion = (collections: [PhotoCollection]?, error: Errorable?)

typealias PhotosSearchCompletion = (PhotosSearchResponse?, Errorable?) -> Void
typealias CollectionsSearchCompletion = (CollectionsSearchResponse?, Errorable?) -> Void
typealias UsersSearchCompletion = (UsersSearchResponse?, Errorable?) -> Void

// MARK: - Contstants

enum Constants {
    
    enum Notification {
        static let photoSaveSucceeded = Foundation.Notification.Name("PhotoSaveSucceeded")
        static let photoSaveFailed = Foundation.Notification.Name("PhotoSaveFailed")
    }
    
    enum TimeInterval {
        static let stubDelay: Double = 0.2
    }
}
