//
//  BrowseInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation
import UIKit

protocol BrowseInteractable {
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion)
    func saveImage(from url: URL)
}

class BrowseInteractor: Interactor, BrowseInteractable {
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listPhotos(request: request, completion: completion)
    }
    
    func saveImage(from url: URL) {
        services.photos.saveImage(from: url)
    }
}
