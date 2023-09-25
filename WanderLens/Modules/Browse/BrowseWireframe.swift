//
//  BrowseWireframe.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation

class BrowseWireframe {
    
    @MainActor
    static func makeView(interactor: BrowseInteractable, router: BrowseRouter?) -> BrowseView {
        let presenter = BrowsePresenter(interactor: interactor, router: router)
        return BrowseView(presenter: presenter)
    }
}
