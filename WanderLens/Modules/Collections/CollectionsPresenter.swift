//
//  CollectionsPresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI
import Combine

@MainActor
class CollectionsPresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded(collections: [PhotoCollection])
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    @Published var alert: AlertType?
    
    // MARK: - Properties
    
    private let interactor: CollectionsInteractable
    private weak var router: CollectionsRouter?
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Proxies
    
    
    // MARK: - Initialiser
    
    init(interactor: CollectionsInteractable, router: CollectionsRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        fetchCollections()
    }
    
    // MARK: - Private Methods
    
    private func fetchCollections() {
        interactor.listCollections(page: 0, orderedBy: .popularity) { [weak self] collections, error in
            guard let self else { return }
            
            guard let collections else {
                state = .error(message: error?.localizedDescription)
                return
            }
            
            state = .loaded(collections: collections)
        }
    }
}
