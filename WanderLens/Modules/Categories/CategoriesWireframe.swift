//
//  BrowseWireframe.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import Foundation

class CategoriesWireframe {
    
    @MainActor
    static func makeView(interactor: CategoriesInteractable, router: CategoriesRouter?) -> CategoriesView {
        let presenter = CategoriesPresenter(interactor: interactor, router: router)
        return CategoriesView(presenter: presenter)
    }
}
