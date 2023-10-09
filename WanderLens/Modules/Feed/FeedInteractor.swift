//
//  FeedInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation
import UIKit

protocol FeedInteractable {
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion)
    func listCollections(page: Int, orderedBy order: ListRequest.Order, completion: @escaping CollectionsListCompletion)
    func saveImage(from url: URL)
}

class FeedInteractor: Interactor, FeedInteractable {
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listPhotos(request: request, completion: completion)
    }
    
    func listCollections(page: Int, orderedBy order: ListRequest.Order, completion: @escaping CollectionsListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listCollections(request: request, completion: completion)
    }
    
    func saveImage(from url: URL) {
        services.photos.saveImage(from: url)
    }
}
