//
//  FeedInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation
import UIKit

protocol FeedInteractable {
    func listPhotos(page: Int, orderedBy order: ListRequest.Order) async -> PhotosListCompletion
    func listCollections(page: Int, orderedBy order: ListRequest.Order) async -> CollectionsListCompletion
    func saveImage(from url: URL)
}

class FeedInteractor: Interactor, FeedInteractable {
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order) async -> PhotosListCompletion {
        let request = ListRequest(page: page, order: order)
        return await dataProviders.unsplash.listPhotos(request: request)
    }
    
    func listCollections(page: Int, orderedBy order: ListRequest.Order) async -> CollectionsListCompletion {
        let request = ListRequest(page: page, order: order)
        return await dataProviders.unsplash.listCollections(request: request)
    }
    
    func saveImage(from url: URL) {
        services.photos.saveImage(from: url)
    }
}
