//
//  BrowseInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation

protocol BrowseInteractable {
    var locationSuggestions: [String] { get }
    var styleSuggestions: [String] { get }
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion)
}

class BrowseInteractor: Interactor, BrowseInteractable {
    
    var locationSuggestions: [String] {
        ["New York", "Tokyo", "Tel Aviv", "Paris", "London", "Miami", "Dublin", "Barcelona", "Los Angeles", "Dubai", "Rome"]
    }
    
    var styleSuggestions: [String] {
        ["Monochromatic", "Architecture & Interiors", "Nature", "3D Rendres", "Fashion & Beauty", "Animals", "Experimental", "People", "Film", "Traval", "Sports"]
    }
    
    func listPhotos(page: Int, orderedBy order: ListRequest.Order, completion: @escaping PhotosListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listPhotos(request: request, completion: completion)
    }
}
