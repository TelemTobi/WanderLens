//
//  CollectionsInteractor.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import Foundation
import UIKit

protocol CollectionsInteractable {
    func listCollections(page: Int, orderedBy order: ListRequest.Order, completion: @escaping CollectionsListCompletion)
}

class CollectionsInteractor: Interactor, CollectionsInteractable {
    
    func listCollections(page: Int, orderedBy order: ListRequest.Order, completion: @escaping CollectionsListCompletion) {
        let request = ListRequest(page: page, order: order)
        dataProviders.unsplash.listCollections(request: request, completion: completion)
    }
}
