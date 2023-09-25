//
//  BrowsePresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI

@MainActor
class BrowsePresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded(photos: [Photo])
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    
    // MARK: - Properties
    
    private let interactor: BrowseInteractable
    private weak var router: BrowseRouter?
    
    // MARK: - Initialiser
    
    init(interactor: BrowseInteractable, router: BrowseRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        fetchPhotos()
    }
    
    // MARK: - Private Methods
    
    private func fetchPhotos() {
        interactor.listPhotos(page: 0, orderedBy: .popularity) { [weak self] photos, error in
            guard let self else { return }
            
            guard let photos else {
                state = .error(message: error?.localizedDescription)
                return
            }
            
            state = .loaded(photos: photos)
        }
    }
}
