//
//  BrowseWireframe.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import Foundation

class SearchWireframe {
    
    @MainActor
    static func makeView(interactor: SearchInteractable, router: SearchRouter?) -> SearchView {
        let presenter = SearchPresenter(interactor: interactor, router: router)
        return SearchView(presenter: presenter)
    }
}
