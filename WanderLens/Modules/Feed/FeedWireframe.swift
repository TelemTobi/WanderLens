//
//  FeedWireframe.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import Foundation

class FeedWireframe {
    
    @MainActor
    static func makeView(interactor: FeedInteractable, router: FeedRouter?) -> FeedView {
        let presenter = FeedPresenter(interactor: interactor, router: router)
        return FeedView(presenter: presenter)
    }
}
