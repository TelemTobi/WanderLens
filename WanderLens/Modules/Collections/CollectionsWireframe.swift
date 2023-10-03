//
//  BrowseWireframe.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import Foundation

class CollectionsWireframe {
    
    @MainActor
    static func makeView(interactor: CollectionsInteractable, router: CollectionsRouter?) -> CollectionsView {
        let presenter = CollectionsPresenter(interactor: interactor, router: router)
        return CollectionsView(presenter: presenter)
    }
}
