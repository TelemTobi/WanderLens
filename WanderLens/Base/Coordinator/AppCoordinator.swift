//
//  AppCoordinator.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import SwiftUI

// TODO: Come up with a better coordinator pattern for SwiftUI ⚠️

class AppCoordinator: Coordinator, MainScreenRouter, FeedRouter, SearchRouter {
    
    let window: UIWindow
    var interactor: Interactor
    var childCoordinators: [Coordinator] = []
    
    required init(interactor: Interactor) {
        self.window = UIWindow.main ?? UIWindow()
        self.interactor = interactor
    }
    
    @MainActor
    func start() {
        
    }
    
    func finish() {
        
    }
    
    // MARK: - Main Screen
    
    @MainActor
    var mainScreenView: MainScreenView {
        let interactor = MainScreenInteractor(interactable: interactor)
        let view = MainScreenWireframe.makeView(interactor: interactor, router: self)
        return view
    }
    
    // MARK: - Feed
    
    @MainActor
    var feedView: FeedView {
        let interactor = FeedInteractor(interactable: interactor)
        let view = FeedWireframe.makeView(interactor: interactor, router: self)
        return view
    }
    
    // MARK: - Search
    
    @MainActor
    var searchView: SearchView {
        let interactor = SearchInteractor(interactable: interactor)
        let view = SearchWireframe.makeView(interactor: interactor, router: self)
        return view
    }
}
