//
//  BrowseInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation

protocol BrowseInteractable {
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion)
}

class BrowseInteractor: Interactor, BrowseInteractable {
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listPhotos(request: request, completion: completion)
    }
}
