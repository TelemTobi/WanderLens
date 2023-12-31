//
//  MainScreenPresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 21/09/2023.
//

import SwiftUI

@MainActor
class MainScreenPresenter: ObservableObject {
    
    // MARK: - Properties
    
    private let interactor: MainScreenInteractable
    private weak var router: MainScreenRouter?

    // MARK: - Proxies
    
    var feedView: FeedView? { router?.feedView }
    var searchView: SearchView? { router?.searchView }
    
    // MARK: - Initialiser
    
    init(interactor: MainScreenInteractable, router: MainScreenRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        
    }
}
